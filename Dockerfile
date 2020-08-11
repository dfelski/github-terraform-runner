FROM debian:10-slim AS builder

RUN apt update && apt install -y wget unzip;

# Download and unpack Terraform
ARG TERRAFORM_VERSION=0.13.0

RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O terraform.zip && unzip -o terraform.zip && rm terraform.zip

FROM tcardonne/github-runner:v1.5.0

RUN apt update && apt install -y ssh;

# Add github.com to ~/.ssh/known_hosts
RUN mkdir ~/.ssh && ssh-keyscan -t rsa,dsa github.com > ~/.ssh/known_hosts

# Install Terraform
COPY --from=builder /terraform /usr/bin/terraform
