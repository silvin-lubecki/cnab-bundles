FROM ubuntu

ARG TERRAFORM_VERSION=0.12.18

# install terraform
RUN apt-get update && apt-get -y install wget unzip
RUN wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    mv terraform /usr/local/bin

# initialize terraform
WORKDIR /cnab/app
COPY cnab/app /cnab/app
RUN chmod +x /cnab/app/run
RUN terraform init

# CNAB part
CMD /cnab/app/run
