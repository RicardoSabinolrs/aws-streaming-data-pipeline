release: init build_function_raw build_function_cleaned plan

init:
	cd terraform/ && terraform init

plan:
	cd terraform/ && terraform plan

validate:
	cd terraform/ && terraform validate

fmt:
	cd terraform/ && terraform fmt

apply:
	cd terraform/ && terraform apply -auto-approve

destroy:
	cd terraform/ && terraform destroy -auto-approve

build_function_raw:
	mkdir -p lambdas/punk_api_raw/package && pip3 install -r lambdas/punk_api_raw/requirements.txt --target  lambdas/punk_api_raw/package --upgrade
	cd lambdas/punk_api_raw/package && zip -r9 ../punk_api_raw.zip .
	cd lambdas/punk_api_raw && zip -g punk_api_raw.zip main.py

build_function_cleaned:
	mkdir -p lambdas/punk_api_cleaned/package && pip3 install -r lambdas/punk_api_cleaned/requirements.txt --target  lambdas/punk_api_cleaned/package --upgrade
	cd lambdas/punk_api_cleaned/package && zip -r9 ../punk_api_cleaned.zip .
	cd lambdas/punk_api_cleaned && zip -g punk_api_cleaned.zip main.py

