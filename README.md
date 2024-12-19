# AWS Serverless Web Application

![Architecture GIF](./Readme_Files/serverless%20web%20app.gif)
`This GIF provides a visual representation of the serverless architecture and its workflow.`

## Overview
This project is an AWS serverless web application designed for scalability, efficiency, and global accessibility. The application includes a registration form that interacts with an API for data handling, leveraging AWS services for a seamless and secure user experience.

## Features
- **Serverless Architecture**:
  - **Lambda Functions**: 
    - Handles `POST` requests via `/register` to store user data.
    - Handles `GET` requests via `/users` to retrieve data.
  - **API Gateway**: 
    - Configured with a custom subdomain `api.osama-serverless.online` for secure API endpoints.
- **Custom Domains**:
  - Primary domain: `osama-serverless.online`.
  - Subdomains for API Gateway (`api.osama-serverless.online`) and CloudFront (`www.osama-serverless.online`).
- **Frontend Hosting**:
  - Web application static files stored in an S3 bucket.
  - S3 bucket used as the origin for a CloudFront distribution to ensure global availability and performance.
- **Secure Communication**:
  - All subdomains certified with public SSL certificates issued by AWS Certificate Manager.
- **Data Storage**:
  - DynamoDB used for serverless, scalable, and efficient data storage.

## Getting Started
1. Clone the repository:
   ```bash
   git clone https://github.com/mohammedd2510/AWS_Serverless_Web_App.git
   ```
2. Follow the [Terraform setup guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).
3. Deploy the infrastructure:
   ```bash
   terraform init
   terraform apply
   ```

## Technical Highlights
- **Infrastructure as Code (IaC)**:
  - Reusability and automation achieved with Terraform modules and state management.
- **Serverless Design**:
  - High availability and reduced operational costs.
- **Global Accessibility**:
  - CloudFront ensures low latency and high-speed content delivery.

## Screenshots and Diagrams
### 1. Web App Registration Form
![Web App Screenshot](./Readme_Files/web%20app.png)

`Displays the fully functional web application registration form, where users can input their name, email, phone, and password to register. The form interacts seamlessly with the backend APIs.`

### 2. API Gateway Resources and Methods
![API Gateway Screenshot](./Readme_Files/api%20gateway.png)
`This image shows the configured resources and methods (POST /register and GET /users) in the API Gateway.`

### 3. Lambda Functions
![Lambda Functions Screenshot](./Readme_Files/Lambda%20Functions.png)
`Displays the two Lambda functions used for handling POST and GET requests.`

### 4. CloudFront Distribution
![CloudFront Distribution Screenshot](./Readme_Files/cloudfront%20distrubution.png)
`Illustrates the CloudFront distribution set up for global content delivery with an alternate domain name.`

### 5. S3 Bucket Frontend Objects
![S3 Bucket Screenshot](./Readme_Files/s3%20bucket.png)
`Highlights the S3 bucket containing the frontend files (index.html and script.js).`

### 6. Route 53 Records
![Route 53 Records Screenshot](./Readme_Files/Route53%20Records.png)

`Shows the DNS records configured in Route 53 for the custom domains.`

### 7. ACM Certificate
![ACM Certificate Screenshot](./Readme_Files/ACM%20certificate.png)

`Demonstrates the SSL certificate issued by AWS Certificate Manager for secure communication.`

## Lessons Learned
- Deepened understanding of AWS services such as API Gateway, Lambda, DynamoDB, Route 53, CloudFront, and Certificate Manager.
- Practical knowledge of serverless architecture principles and their application in real-world projects.
- Gained expertise in cloud computing and infrastructure provisioning with Terraform.

## Live Demo
- **Frontend**: [www.osama-serverless.online](https://www.osama-serverless.online)
- **API**: [api.osama-serverless.online](https://api.osama-serverless.online)

## Contributing
Contributions are welcome! Feel free to open an issue or submit a pull request.

