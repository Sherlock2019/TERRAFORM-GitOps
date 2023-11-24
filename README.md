

Author Dzoan nguyen tran 
**Dzoan Nguyen Tran**
*Expert Network & SRE DevOps & AWS AZURE GCP Architect with Machine learning and Blockchain Skills 

https://github.com/Sherlock2019?tab=repositories

📧 [dzoannguyentran@gmail.com]
📞 +84 908618075 based in  Vietnam currently
🌍 Nationalities: French & Vietnamese



*** about my skills **** 

Devops Blockchain skills : create and optimise infra and devops workflow for Smart contract, Dapps on  blockchain networks.  
data engineering : kinesis data streaning , firehose , kafka , ETL AWS Glue, aws EMR ,  AWS data lake model , data warehouse redshift ,   
Machine Learning  modeling : AWS Sagemaker , aws rekognition comprehend,  GCP auto ML vertex Studio , Azure ML  

Education and Certifications

- AWS GCP AZure solutions Architect Professional Level
- Azure Solutions Architect  Expert Level
- GCP infrastructure enginneer  
- Blockchain Dev ( currently training to become blockchain dev ) 
- AWS machine learning specialization
- AWS Cloud Practitioner**
-- Certified Expert troubleshooting engineer  https://www.kepner-tregoe.com/aboutkt/ 
- Network Architect:** CCNA, CCNP, CCND
- Telecom Degree:** BTS Telecom, AFPA TELECOM, Paris, 1995-1996
- BD:** El Camino College-Compton Center, Compton, 1986-1990




# TERRAFORM-GitOps
a crypto exchange infra manged by IAC terraform and using GitOps cicd

###  POC  to use Terraform or IAC tools to provision  a crypto exchange cloud infrastructure.####


what are the main components ? 

1. Compute Resources:
Virtual Machines/Instances: For hosting the exchange platform, order matching engines, and other services.
Auto Scaling: To dynamically adjust the number of active instances based on load.

Load Balancers: To distribute traffic across instances for better performance and availability.

2. Database and Storage:
Database Services: For transaction data, order books, user accounts, etc. This could be SQL (like AWS RDS, Aurora) or NoSQL databases.
Data Warehousing: For analytics and historical data storage.
Object Storage: For storing logs, backups, and user documents like ID proofs.

3. Networking:
Virtual Private Cloud (VPC): To isolate resources in a virtual network.
Subnets: For segmenting the VPC into network segments.
VPN and Direct Connect: For secure connections to on-premises data centers if needed.
Content Delivery Network (CDN): To cache and deliver content globally, reducing latency.

4. Security:

Firewalls and Web Application Firewalls (WAF): To protect against common web threats.
DDoS Protection: To safeguard against distributed denial-of-service attacks.
Identity and Access Management (IAM): For controlling user access to cloud resources.
Encryption: For data at rest and in transit.
Key Management Service (KMS): For managing cryptographic keys.
Multi-Factor Authentication (MFA): For enhanced user authentication.

5. Monitoring and Compliance:
Monitoring and Alerting Tools: Like AWS CloudWatch, Prometheusfor real-time monitoring of infrastructure.
Logging and Audit Trails: For tracking user activities and changes in the environment.
Compliance Management: To adhere to financial and data protection regulations.


6. Application Services:

API Gateway: For managing and securing APIs.
Microservices Architecture: For modular and scalable application development.
Serverless Functions: For executing code in response to events without managing servers.

7. Disaster Recovery and Data Backup:
Snapshot and Backup Services: For data redundancy.
Disaster Recovery Planning: To ensure business continuity in case of outages.

8. DevOps and Automation:

CI/CD Pipelines: Gitlab Ci , Git hub actions  For automated testing and deployment.

Infrastructure as Code:  Cloud formation , Terraform , Ansible .
Configuration Management Tools: Like Ansible, Puppet, or Chef.


9. Blockchain Nodes:

Blockchain Infrastructure: For processing blockchain transactions, which may include running full nodes of various cryptocurrencies.

10. Integration with External Services:
Banking and Payment APIs: For fiat transactions.
KYC/AML Verification Services: For user verification and compliance


10. Data engineering and Machine learning

 
using  Kinesis Data stream -- SQL load balancing and Queueing - ETL glue -- Athena for SQL --- ML sagemaker --- Datawarehouse --- Dasboard quicksight 



2. Terraform Configuration Model :


Modules: Create Terraform modules for each component of the infrastructure.

Variables and Outputs: Define variables in variables.tf and outputs in outputs.tf for each module.

Resource Creation: Write Terraform configuration for creating AWS resources, configuring security, networking, etc.
Advanced Features:

Workspaces: Use Terraform workspaces for managing different environments (Dev, Qa uat , staging, production).

Dynamic Blocks: Utilize dynamic blocks for resources that require conditional or repetitive configurations.




 crypto AWS Structure example : 

.
├── .gitlab-ci.yml
├── main.tf
├── variables.tf
├── outputs.tf
└── modules/
    ├── network/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    ├── compute/
    │   ├── main.tf
    │   ├── variables.tf
    │   └── outputs.tf
    └── database/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf




# modules/network/main.tf

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.availability_zone
}

# Additional resources like Internet Gateway, Route Tables, etc.



Data ETL and Machine L Structure
.
├── main.tf
├── variables.tf
├── outputs.tf
└── modules/
    ├── kinesis/
    ├── glue/
    ├── athena/
    ├── sagemaker/
    ├── data_warehouse/
    └── quicksight/


```

Main Terraform File (main.tf)



module "kinesis" {
  source = "./modules/kinesis"
  // Pass any necessary variables
}

module "glue" {
  source = "./modules/glue"
  // ...
}


 Kinesis Data Stream (modules/kinesis/main.tf)

resource "aws_kinesis_stream" "example" {
  name             = "example-kinesis-stream"
  shard_count      = 1
  retention_period = 24

  shard_level_metrics = [
    "IncomingBytes",
    "OutgoingBytes",
  ]
}


AWS Glue for ETL (modules/glue/main.tf)

resource "aws_glue_catalog_database" "example" {
  name = "my_catalog_database"
}

resource "aws_glue_crawler" "example" {
  name       = "example-crawler"
  role       = aws_iam_role.example.arn
  database_name = aws_glue_catalog_database.example.name

  s3_target {
    path = "s3://my-example-bucket/"
  }

  schedule {
    schedule_expression = "cron(0 12 * * ? *)"
  }
}


 Athena for SQL Querying (modules/athena/main.tf)

resource "aws_athena_database" "example" {
  name   = "example_database"
  bucket = aws_s3_bucket.example.bucket
}

resource "aws_athena_named_query" "example" {
  name  = "example_query"
  database = aws_athena_database.example.name
  query = "SELECT * FROM my_table LIMIT 10;"
}

SageMaker for Machine Learning (modules/sagemaker/main.tf)

resource "aws_sagemaker_notebook_instance" "example" {
  name          = "example-notebook-instance"
  role_arn      = aws_iam_role.example.arn
  instance_type = "ml.t2.medium"
}

resource "aws_sagemaker_model" "example" {
  name = "example-model"
  // Define execution role, primary_container, etc.
}
5. Data Warehouse (modules/data_warehouse/main.tf)
Assuming you're using Amazon Redshift as the data warehouse:

hcl
Copy code
resource "aws_redshift_cluster" "example" {
  cluster_identifier = "redshift-cluster-1"
  database_name      = "mydb"
  master_username    = "foo"
  master_password    = "Mustbe8characters"
  node_type          = "dc2.large"
  cluster_type       = "single-node"
}


 QuickSight for Dashboards (modules/quicksight/main.tf)

resource "aws_quicksight_group" "example" {
  group_name = "example-group"
  aws_account_id = data.aws_caller_identity.current.account_id
}

resource "aws_quicksight_user" "example" {
  user_name  = "example_user"
  email      = "user@example.com"
  role       = "READER"
  identity_type = "IAM"
  user_role = "READER"
  aws_account_id = data.aws_caller_identity.current.account_id
}





3. Configure a GitOps pipeline using tools like GitLab CI/CD or GitHub Actions.



Workflow

Development: Developers make changes to Terraform files and push to feature branches.
Review: Open a merge request for the changes. This triggers the validate and plan stages.
Approval: Review the plan in the merge request. If everything looks good, approve the merge request.
Deployment: Once merged into the main branch, the apply stage is manually triggered to update the infrastructure.


Pipeline Stages: Define stages for linting, Terraform plan, and apply. 
Ensure manual approval is required for deploying to production.

Merge Request (MR) Workflow: Use MRs for all changes to the Terraform code to enable code review and auditing.





3- GitLab CI/CD Pipeline Configuration
The .gitlab-ci.yml file defines the CI/CD pipeline. Here's an example setup:


```
# .gitlab-ci.yml

stages:
  - validate
  - plan
  - apply

before_script:
  - export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
  - export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
  - terraform init

validate:
  stage: validate
  script:
    - terraform validate
  only:
    - merge_requests

plan:
  stage: plan
  script:
    - terraform plan -out=tfplan
  artifacts:
    paths:
      - tfplan
  only:
    - merge_requests

apply:
  stage: apply
  script:
    - terraform apply -auto-approve tfplan
  when: manual
  only:
    - main

```

This configuration includes three stages:

Validate: Checks the Terraform files for any syntax errors.


Plan: Runs terraform plan and saves the plan as an artifact. This step is critical for reviewing what Terraform will change before it's applied.

Apply: Applies the Terraform plan. It's set to manual to require explicit approval before changes are made to the infrastructure.





