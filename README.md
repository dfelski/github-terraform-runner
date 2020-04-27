# Github Actions Terraform Runner
Actions runner Docker image for terraform builds.

Based on the great work of [tcardonne] (https://github.com/tcardonne/docker-github-runner)

According the related documentations pass at least the following enviroment variables:

- **RUNNER_NAME**: Name of the runner, will be shown in Github
- **RUNNER_REPOSITORY_URL**: URL of the connected Github
- **RUNNER_TOKEN**: Token for the connection to Github
