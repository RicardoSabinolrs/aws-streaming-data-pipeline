release: build_function_raw plan

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

build_release_function_raw:
	mkdir -p lambdas/punk_api_raw/package && pip3 install -r lambdas/punk_api_raw/requirements.txt --target  lambdas/punk_api_raw/package --upgrade --use-feature=2020-resolver

zip_function_raw:
	cd lambdas/punk_api_raw/package && zip -r9 ../punk_api_raw.zip .

zip_main_raw_py:
	cd lambdas/punk_api_cleaned && zip -g punk_api_cleaned.zip main.py

build_release_function_cleaned:
	mkdir -p lambdas/punk_api_cleaned/package && pip3 install -r lambdas/punk_api_cleaned/requirements.txt --target  lambdas/punk_api_cleaned/package --upgrade --use-feature=2020-resolver

zip_function_cleaned:
	cd lambdas/punk_api_cleaned/package && zip -r9 ../punk_api_cleaned.zip .

zip_main_cleaned_py:
	cd lambdas/punk_api_cleaned && zip -g punk_api_cleaned.zip main.py

build_function_raw: init build_release_function_raw zip_function_raw zip_main_raw_py

build_function_cleaned: init build_release_function_cleaned zip_function_cleaned zip_main_cleaned_py
