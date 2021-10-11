# Traditional CI GitHub Actions

## Introduction

The following example shows you how GitHub Actions jobs help you setup a CI workflow

## Creating your first CI workflow

1. Fork this repo from  [here](https://github.com/wizelineacademy/github-actions-tutorial) or create a new repo from [here](https://github.com/new)

1. Start the web editor by pressing "." in your repo `https://github.com/<yourusername>/github-actions-tutorial`

1. Create a new branch

1. Create a `.github/workflows` directory in  your repository in GitHub if this directory does not already exist.

1. In the `.github/workflows` directory, create a file named gh-ci-demo.yml

1. Copy the following YAML contents into the `gh-ci-demo.yml` file:

```yaml{:copy}
name: GitHub Actions CI
on:
  pull_request:
    branches: [main]
jobs:
  mysite-ci:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout main
        uses: actions/checkout@v2
      - name: install dependencies
        run: make deps
      - name: test code
        run: make test
      - name: build code
        run: make build
      - name: store artifact
        run: echo "save artifact where you want"
```

1. Create a PR with new branch and use main as base branch

1. Review Action Tab

1. Lets update our makefile deps command with

```bash
deps: ## Install dependencies
  @echo "install  deps"
  npm install -g markdownlint-cli
```

1. Lets update our makefile test command with

```bash
.PHONY: test
test: ## Unit test our code
  @echo "testing code"
  markdownlint -f 'static_hugo_site/content/**/*.md'
```

1. Review our current Open PR for failed CI

1. Lets fix our fix `static_hugo_site/content/elements/text.md` line 36 and 48 by adding one extra dash

1. Commit file

1. Review our current Open PR for Pass CI
