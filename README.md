🎯 Purpose



This project demonstrates my ability to design, deploy, and monitor a cloud-native application using Azure, Terraform, and Docker.



It highlights skills in:

\- Infrastructure as Code (Terraform)

\- Container deployment (Azure Container Instances)

\- Cloud networking and public endpoints

\- Monitoring and observability (Azure Log Analytics)

\- DevOps workflows using CLI tools

--------



🚀 Cloud AI Infrastructure Project (Azure + Terraform + Docker)



📌 Overview



This project demonstrates how to deploy a containerized web application to Microsoft Azure using Terraform Infrastructure as Code (IaC) and Docker.



It provisions a fully working cloud environment including:



* Azure Resource Group
* Azure Container Instance (ACI)
* Public FQDN endpoint
* Azure Log Analytics for monitoring
* Docker image hosted on Docker Hub



This project simulates a real-world cloud engineering deployment pipeline.

--------



🌐 Live Demo



Public Endpoint:  

http://cloud-ai-9e9a8e29.westus2.azurecontainer.io



> ⚠️ Note: The container is stopped when not in use to prevent Azure charges.  

> It can be started on-demand using Azure CLI.

--------



🏗️ Architecture



User accesses a public web app deployed in Azure Container Instances. The container image is pulled from Docker Hub at deployment time, and logs are streamed into Azure Log Analytics.



Flow:



-User → Web Browser → Internet

-Internet → Azure Container Instance (Public Endpoint)

-ACI pulls Docker image from Docker Hub

-Terraform provisions all Azure resources

-Logs + metrics sent to Azure Log Analytics



!\[Architecture Diagram](docs/architecture.png)

---------



🧰 Tech Stack



Cloud Provider: Microsoft Azure



* Infrastructure as Code: Terraform
* Containerization: Docker
* Registry: Docker Hub
* Compute: Azure Container Instances (ACI)
* Monitoring: Azure Log Analytics
* CLI Tools: Azure CLI, Terraform CLI, Docker CLI

----------



📁 Project Structure

cloud-ai-infra-project/

│

├── app/                    # Web application source code

├── terraform/              # Terraform infrastructure files

│   ├── main.tf

│   └── variables.tf

├── docs/                   # Architecture diagram + screenshots

│   ├── architecture.png

│   ├── terraform-apply.png

│   └── logs.png

└── README.md

----------



⚙️ Deployment Steps

1️⃣ Build Docker Image

docker build -t cloud-ai-app:1.0 .

docker tag cloud-ai-app:1.0 <your-dockerhub-username>/cloud-ai-app:1.0

docker push <your-dockerhub-username>/cloud-ai-app:1.0



2️⃣ Deploy Infrastructure with Terraform

cd terraform



terraform init

terraform plan

terraform apply



3️⃣ Access the Application



After deployment, Terraform outputs a public FQDN:

http://cloud-ai-xxxxx.westus2.azurecontainer.io



Opening this in a browser shows:



Cloud Infra Project is LIVE 🚀



4️⃣ View Logs in Azure



Navigate to:

Azure Portal → Log Analytics Workspace → Logs



Run query:



ContainerInstanceLog\_CL

| limit 50



This shows real-time container logs.



---------



💡 Skills Demonstrated



\- Azure Container Instances (ACI)

\- Terraform Infrastructure as Code

\- Azure Resource Group provisioning

\- Azure Log Analytics monitoring

\- Docker containerization

\- Docker Hub image registry

\- CLI-based cloud deployments

\- Cloud architecture design

---------



🚀 Future Improvements



\- Add Azure Application Gateway or Front Door

\- Implement HTTPS with custom domain

\- Use Azure Container Apps or AKS for scaling

\- Add CI/CD pipeline (GitHub Actions)

\- Add autoscaling and load balancing














