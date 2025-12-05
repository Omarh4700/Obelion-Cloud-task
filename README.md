# Obelion Cloud Infrastructure & CI/CD

This repository contains the complete Infrastructure as Code (Terraform) and CI/CD automation (GitHub Actions/Docker) for the Obelion Cloud challenge.

## 🏗 System Architecture

The project deploys a secure, 2-tier architecture on AWS:

```mermaid
graph TD
    User([User]) -->|HTTP:80| Frontend[Frontend Instance<br>Uptime Kuma<br>Public Subnet]
    Frontend -->|HTTP:80<br>Internal| Backend[Backend Instance<br>Laravel API<br>Private Subnet]
    Backend -->|TCP:3306<br>Internal| DB[(RDS MySQL<br>Private Subnet)]
    
    subgraph VPC [AWS VPC eu-west-1]
        Frontend
        subgraph Private [Private Network]
            Backend
            DB
        end
    end
```

## 📂 Repository Structure

- `terraform/`: Complete Terraform configuration broken down into modules.
    - `modules/01-vpc`: Networking (VPC, IGW).
    - `modules/06-instances`: EC2 Compute resources.
    - `modules/08-nacl`: Network Access Control Lists (Security).
- `apps/`: Application source code and deployment logic.
    - `frontend/`: Uptime Kuma Docker configuration.
    - `backend/`: Laravel API Application & Workflows.

## 🚀 Setup & Deployment

### 1. Infrastructure (Terraform)
Navigate to the terraform directory and apply the configuration:
```bash
cd terraform
terraform init
terraform apply
```
**Outputs:**
- `Frontend-Public-IP`: Access Uptime Kuma.
- `Backend-Private-IP`: Internal API IP for monitoring.

### 2. Frontend Application (Uptime Kuma)
Uptime Kuma is automatically deployed via `user_data` and Docker Compose.
- **Access**: `http://<Frontend-IP>`
- **Default Port**: 80

### 3. Backend Application (Laravel)
The backend is provisioned on a private instance.
- **Access**: Internal Only (`http://10.0.x.x`).
- **Deployment**: Automatic via GitHub Actions (or Manual Script).

## 📸 Screenshots

### 1. Initial Setup
![Setup](screenshots/01_setup.png)

### 2. Dashboard
![Dashboard](screenshots/02_dashboard.png)

### 3. Adding Backend Monitor
![Add Monitor](screenshots/03_add_monitor.png)

### 4. Verified Connectivity (Up)
![Monitor Up](screenshots/04_monitor_up.png)
