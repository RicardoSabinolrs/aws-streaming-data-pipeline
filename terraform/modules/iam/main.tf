data "aws_iam_policy_document" "AWSLambdaTrustPolicy" {
  statement {
    actions    = ["sts:AssumeRole"]
    effect     = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_raw_role" {
  name = var.lambda_raw_role_name
  assume_role_policy = data.aws_iam_policy_document.AWSLambdaTrustPolicy.json
}

resource "aws_iam_role_policy_attachment" "lambda_raw_policy" {
  role       = aws_iam_role.lambda_raw_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_iam_role" "firehose_role" {
  name               = var.firehose_role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role" "lambda_raw_to_kinesis_stream_role" {
  name               = var.lambda_to_kinesis_stream_role_name
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": [
          "lambda.amazonaws.com",
          "kinesis.amazonaws.com"
        ]
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "firehole_policy" {
  name       = var.firehole_policy_name
  role       = aws_iam_role.firehose_role.id
  depends_on = [aws_iam_role.firehose_role]
  policy     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": [
        "s3:AbortMultipartUpload",
        "s3:GetBucketLocation",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:ListBucketMultipartUploads",
        "s3:PutObject"
      ],
      "Resource": [
        "${var.bucket_raw_arn}",
        "${var.bucket_raw_arn}/*",
        "${var.bucket_cleaned_arn}",
        "${var.bucket_cleaned_arn}/*"
      ]
    },
    {
      "Sid": "",
      "Effect": "Allow",
      "Action": [
        "kinesis:DescribeStream",
        "kinesis:GetShardIterator",
        "kinesis:GetRecords",
        "kinesis:ListShards"
      ],
      "Resource": "${var.kinesis_stream_arn}"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "lambda_raw_policy" {
  name       = var.lambda_raw_policy_name
  role       = aws_iam_role.lambda_raw_to_kinesis_stream_role.id
  depends_on = [aws_iam_role.lambda_raw_to_kinesis_stream_role]
  policy     = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "kinesis:PutRecord"
      ],
      "Resource": "${var.kinesis_stream_arn}"
    }
  ]
}
EOF
}