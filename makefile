.PHONY: help
help: ## Display this help screen
	@echo "Please use \`make <target>' where <target> is one of"
	@grep -E '^[a-zA-Z_-][a-zA-Z_\-\/]+[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\t\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo "make sure to populate your env with \`source bin/env' before using this tool"

.PHONY: deps
deps: ## Install dependencies
	@echo "install  deps"
	npm install -g markdownlint-cli

.PHONY: test
test: ## Unit test our code
		@echo "testing code"
		markdownlint -f 'static_hugo_site/content/**/*.md'

.PHONY: build
build: ## Builds our code 
	@echo "building site"

.PHONY: deploy
deploy: ## Deploys our built artifact
	@echo "deploys our built artifact"