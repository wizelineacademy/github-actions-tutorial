# GitHub Actions CD workflow

## Introduction

The following example shows you how GitHub Actions jobs help you setup a CD workflow and deploy a Hugo site

## Creating your first CI workflow

1. Fork this repo from  [here](https://github.com/wizelineacademy/github-actions-tutorial) or create a new repo from [here](https://github.com/new)

1. Start the web editor by pressing "." in your repo `https://github.com/<yourusername>/github-actions-tutorial`

1. Create a `.github/workflows` directory in  your repository in GitHub if this directory does not already exist.

1. In the `.github/workflows` directory, create a file named gh-hugo-deploy.yml

1. Copy the following YAML contents into the `gh-hugo-deploy.yml` file:

```yaml{:copy}
name: Deploy hugo site to gihubpages
on:
  workflow_dispatch:
  push:
    branches:
      - main

jobs:
  hugo-github-pages:
    name: hugo-github-pages
    runs-on: ubuntu-latest
    strategy:
        matrix:
          node-version: [10.x]  
    steps:
      - name: Checkout base branch
        uses: actions/checkout@v2
        with:
          token: ${{ secrets.MY_GITHUB_TOKEN }}
          
      - name: build hugo
        uses: ./action/deploy_hugo/
        env:
          GITHUB_TOKEN: ${{ secrets.MY_GITHUB_TOKEN }}

```

1. Create Dev token [here](https://github.com/settings/tokens)

1. Create Secret `MY_GITHUB_TOKEN` in https://github.com/<username>/github-actions-tutorial/settings/secrets/actions/new

1. Commit new cd workflow into main

1. Active GitHub Pages. Navigate to your repo settings and in the side menu select Pages

1. Select the gh-pages as your source branch and /docs for the folder and click on save

1. Navigate to your publish site

1. Fix your site config  in `static_hugo_site/config.toml` , `static_hugo_site/config/_default` and
   `static_hugo_site/config/production`. the `baseURL` setting to your site URL
   It will look like `https://<user>.github.io/github-actions-tutorial/`
