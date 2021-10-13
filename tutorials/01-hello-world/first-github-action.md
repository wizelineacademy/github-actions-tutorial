# Quickstart for GitHub Actions

## Introduction

You only need a GitHub repository to create and run a GitHub Action workflow. In this guide, you'll add a workflow that demonstrates some of the essential features of GitHub Actions. 

The following example shows you how GitHub Actions jobs can be automatically triggered, where they run, and how they can interact with the code in your repository.

## Creating your first workflow

1. Fork this repo from  [here](https://github.com/wizelineacademy/github-actions-tutorial) or create a new repo from [here](https://github.com/new)

1. Start the web editor by pressing "." in your repo `https://github.com/<yourusername>/github-actions-tutorial`

1. Create a new branch

1. Create a `.github/workflows` directory in  your repository in GitHub if this directory does not already exist.

1. In the `.github/workflows` directory, create a file named `github-actions-demo.yml`. 

1. Copy the following YAML contents into the `github-actions-demo.yml` file:

```yaml{:copy}
name: GitHub Actions Demo
on: [push]
jobs:
  Explore-GitHub-Actions:
    runs-on: ubuntu-latest
    steps:
      - run: echo "🎉 The job was automatically triggered by a ${{ github.event_name }} event."
      - run: echo "🐧 This job is now running on a ${{ runner.os }} server hosted by GitHub!"
      - run: echo "🔎 The name of your branch is ${{ github.ref }} and your repository is ${{ github.repository }}."
      - name: Check out repository code
        uses: actions/checkout@v2
      - run: echo "💡 The ${{ github.repository }} repository has been cloned to the runner."
      - run: echo "🖥️ The workflow is now ready to test your code on the runner."
      - name: List files in the repository
        run: |
          ls ${{ github.workspace }}
      - name: View the github context
        run: echo "$GITHUB_CONTEXT"
        env:
          GITHUB_CONTEXT: ${{ toJson(github) }}
      - run: echo "🍏 This job's status is ${{ job.status }}".
```

1. Committing the workflow file to a branch in your repository triggers the `push` event and runs your workflow.

## Viewing your workflow results

1. On GitHub, navigate to the main page of the repository.
1. Under your repository name, click Actions.
    ![Actions](https://docs.github.com/assets/images/help/repository/actions-tab.png)
1. In the left sidebar, click the workflow you want to see.

   ![Workflow list in left sidebar](https://docs.github.com/assets/images/help/repository/actions-quickstart-workflow-sidebar.png)
1. From the list of workflow runs, click the name of the run you want to see.

   ![Name of workflow run](https://docs.github.com/assets/images/help/repository/actions-quickstart-run-name.png)
1. Under **Jobs** , click the **Explore-GitHub-Actions** job.

   ![Locate job](https://docs.github.com/assets/images/help/repository/actions-quickstart-job.png)
1. The log shows you how each of the steps was processed. Expand any of the steps to view its details.

   ![Example workflow results](https://docs.github.com/assets/images/help/repository/actions-quickstart-logs.png)

For example, you can see the list of files in your repository:
   ![Example action detail](https://docs.github.com/assets/images/help/repository/actions-quickstart-log-detail.png)