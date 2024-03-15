#AWS Lambda Text Translation Project
This project is a demonstration of using Terraform to deploy an AWS Lambda function that translates text files from one S3 bucket to another using AWS Translate service.

#Overview
AWS Lambda is a serverless computing service provided by Amazon Web Services. It allows you to run code without provisioning or managing servers. This project demonstrates the use of AWS Lambda to perform text translation using AWS Translate service.

#Features
-Uploads a text file to an input S3 bucket.
-Triggers an AWS Lambda function whenever a new text file is uploaded.
-Translates the text content of the file to German using AWS Translate.
-Stores the translated text file in an output S3 bucket.

#Prerequisites
Before deploying this project, ensure you have the following:

-An AWS account.
-AWS CLI configured with appropriate permissions.
-Terraform installed on your local machine.
-Basic understanding of AWS Lambda, S3, and Terraform.
