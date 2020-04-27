FROM debian:10-slim AS builder

RUN apt update && apt install -y wget unzip;

# Download and unpack Terraform
ARG TERRAFORM_VERSION=0.12.24

RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O terraform.zip && unzip -o terraform.zip && rm terraform.zip

FROM tcardonne/github-runner:latest

# Install Terraform
COPY --from=builder /terraform /usr/bin/terraform
#RUN ln -s /usr/share/terraform /usr/bin/terraform
