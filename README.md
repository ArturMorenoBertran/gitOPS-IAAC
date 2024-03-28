**#############**
**Introduction**
**#############**

This project uses the GitOps methodology for deploying a microservice on AWS, at both code and infrastructure levels, providing a control mechanism in both areas.

This is achieved by automating infrastructure code using Terraform and microservice code through CI/CD pipelines, storing all code in the Git version control system.

Additionally, access to code modification is only permitted through Git, providing control over users making changes and ensuring that the code passes through defined quality filters. 
This prevents administrators or any user from connecting to the AWS infrastructure with an IAM account and making manual changes that could cause issues or simply be difficult to track.

**#############**
**Architecture**
**#############**

As mentioned, this project revolves around GitHub. We have two repositories:

    gitOPS-IAAC: for Terraform code (Infrastructure)
    gitOPS-APP: for application code (Build, Test & Deploy)

Both have a defined workflow that detects changes in the code and applies it to the infrastructure/application.

In the gitOPS-IAAC repository, there are two branches: "stage" and "main".
If any changes are made in the "stage" branch, the workflow will detect it and the Terraform code will be tested.
When we merge the "stage" branch with the "main" branch, the changes will be uploaded to AWS.
(In a production environment, the pull request should be approved beforehand)

**#############**
**Before start**
**#############**

Make sure you have access to your Git repository using some type of credential

This project is based on AWS and its creation will contains charges in your bill.

- Create an IAM user

- Create an access key for your IAM user and store its values in Git Secrets for both repositories.

*Make sure that all services are created in the same region*

- Create S3 bucket. We will use it to store the terraform state.
  Store the bucket name as a secret in Git Secrets only in gitOPS-IAAC repository.

- Create an ECR.
  Store the URL as a secret in Git Secrets only in gitOPS-APP repository.


**#################################**
**CHANGES ON gitOPS-IAAC REPOSITORY**
**#################################**

- On "variables.tf" file, modify "region" variable data with your region.

- Open the "terraform.tf" file and update the "backend" entry  with your S3 bucked name an your region.
  *If you change the versions of the modules or providers, it might not work*

- Replace the enviroment variables in the git actions file (.github/workflows/terraform.yml).

- IT MUST BE READY FOR USE.

