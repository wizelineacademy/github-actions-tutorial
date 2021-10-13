# GitHub Actions - Reusing your actions

## Introduction

The following example shows you how GitHub Actions can be reused from the marketplace

## Creating your first CI workflow

1. Fork this repo from  [here](https://github.com/wizelineacademy/github-actions-tutorial) or create a new repo from [here](https://github.com/new)

1. Start the web editor by pressing "." in your repo `https://github.com/<yourusername>/github-actions-tutorial`

1. Create a new branch

1. Create a `.github/workflows` directory in  your repository in GitHub if this directory does not already exist.

1. In the `.github/workflows` directory, create a file named gh-ci-reuse.yml

1. Copy the following YAML contents into the `gh-ci-reuse.yml` file:

```yaml{:copy}
name: GitHub Actions Reusable actions
on:
  pull_request:
    branches: [main]
jobs:
  reuse-ci:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout main
        uses: actions/checkout@v2
      - name: reviewdog-markdownlint
        uses: reviewdog/action-markdownlint@v0.2.0
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          reporter: github-pr-review
          filter_mode: nofilter # file to only check new or mod files
```

1. Create a PR with new branch and use main as base branch

1. Review Action Tab

1. Review our current Open PR for failed CI

1. Lets fix our fix `static_hugo_site/content/elements/text.md` line 36 and 48 by adding one extra dash character

1. Commit file

1. Review our current Open PR for Pass CI
