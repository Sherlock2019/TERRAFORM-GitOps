

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

*******************************************************************


#    Deployment Process and template  for a Crypto Exchange infra (  with  securisation , key  and secrets management  Data ETL and Machine learning -- Monitoring Quicksight  ) on AWS  using  infra as code TERRAFORM , and GitOps  CICD for automated AWS infra management .

#  Goal : to have Guidelines and Framework to customize to your owns needs 
#  This not a ready to use configuration , you need to customize your own needs 


what are the main components of a Crypto exchange ? 

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





2. Terraform Configuration Structure :


Modules: Create Terraform modules for each component of the infrastructure.

Variables and Outputs: Define variables in variables.tf and outputs in outputs.tf for each module.

Resource Creation: Write Terraform configuration for creating AWS resources, configuring security, networking, etc.
Advanced Features:

Workspaces: Use Terraform workspaces for managing different environments (Dev, Qa uat , staging, production).

Dynamic Blocks: Utilize dynamic blocks for resources that require conditional or repetitive configurations.


structure 
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


3. Configure a GitOps pipeline using tools like GitLab CI/CD or GitHub Actions.



Workflow

Development: Developers make changes to Terraform files and push to feature branches.
Review: Open a merge request for the changes. This triggers the validate and plan stages.
Approval: Review the plan in the merge request. If everything looks good, approve the merge request.
Deployment: Once merged into the main branch, the apply stage is manually triggered to update the infrastructure.


Pipeline Stages: Define stages for linting, Terraform plan, and apply. 
Ensure manual approval is required for deploying to production.

Merge Request (MR) Workflow: Use MRs for all changes to the Terraform code to enable code review and auditing.





3-  the  Deployment of  Terraform  repo suing GitLab CI/CD Pipeline

Configuration
The .gitlab-ci.yml file defines the CI/CD pipeline. Here's an example setup:

This configuration includes three stages:

Validate: Checks the Terraform files for any syntax errors.


Plan: Runs terraform plan and saves the plan as an artifact. This step is critical for reviewing what Terraform will change before it's applied.

Apply: Applies the Terraform plan. It's set to manual to require explicit approval before changes are made to the infrastructure.


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






