include meta.mk help.mk

env-file: ## Create .env file
env-file: .env.example
	@cp .env.example .env

build: ## Build the docker container
build:
	@$(SHELL_EXPORT) docker build \
		--tag danazkari/minica:$(VERSION) \
		--tag danazkari/minica:latest \
		.

run: ## Run minica
run: .env build
	@mkdir -p $(OUTPUT_DIRECTORY)
	@$(SHELL_EXPORT) docker run \
		--user $(shell id -u):$(shell id -g) \
		-it \
		-v $(OUTPUT_DIRECTORY):/certs \
		danazkari/minica \
			--domains $(DOMAINS) \
			--ip-addresses $(IP_ADDRESS)
