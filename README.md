# AWS Streaming Data Pipeline

## Objetivo
Este projeto visa consumir a [API Punk API](https://punkapi.com/documentation/v2), a fim de criar um Pipeline de ingestão de dados utilizando os serviços de Big Data da AWS. :beers::beers:


___
# Este projeto utiliza

- [AWS Lambda](https://aws.amazon.com/pt/lambda/)
- [AWS Cloud Watch](https://aws.amazon.com/pt/cloudwatch/)
- [AWS Kinesis Stream](https://aws.amazon.com/pt/kinesis/data-streams/)
- [AWS Kinesis Firehose](https://aws.amazon.com/pt/kinesis/data-firehose/?kinesis-blogs.sort-by=item.additionalFields.createdDate&kinesis-blogs.sort-order=desc)
- [AWS Glue](https://aws.amazon.com/pt/glue/)
- [AWS S3](https://aws.amazon.com/pt/s3/)
- [Terraform](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

# Arquitetura
![Image](docs/data-pipeline.png)

---
# Como usar o repositório
---
## Quickstart
```shell
$ git clone https://github.com/RicardoSabinolrs/aws-streaming-data-pipeline.git
$ cd aws-streaming-data-pipeline/
$ make release  
$ make apply
```
## Exportar suas credenciais da AWS
__Com Linux ou MacOS__
```
export AWS_ACCESS_KEY_ID=<< Seu ID de acesso >>
export AWS_SECRET_ACCESS_KEY=<< Sua Chave de acesso>>
export AWS_DEFAULT_REGION=<< Região >>
```
__Com Windows (CommandPrompt)__ 

```
setx AWS_ACCESS_KEY_ID=<< Seu ID de acesso >>
setx AWS_SECRET_ACCESS_KEY=<< Sua Chave de acesso>>
setx AWS_DEFAULT_REGION=<< Região >>
```
__Com Windows (PowerShell)__ 
```
$Env:AWS_ACCESS_KEY_ID="AKIAIOSFODNN7EXAMPLE"
$Env:AWS_SECRET_ACCESS_KEY="wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
$Env:AWS_DEFAULT_REGION="us-west-2"
```