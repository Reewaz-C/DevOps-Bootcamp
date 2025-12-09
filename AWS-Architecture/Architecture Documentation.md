# AWS 3-Tier Architecture (Web, App, DB) -- High Availability Design


## 📌 Overview

This is a **highly available, secure, and scalable 3-tier architecture**
deployed inside an AWS VPC.\
The system is divided into:

1.  **Web Tier** -- Public-facing layer\
2.  **Application Tier** -- Private backend layer\
3.  **Database Tier** -- Secure private data layer

All tiers span **two Availability Zones (AZs)** for reliability and
fault tolerance.

------------------------------------------------------------------------

## 🏗 Architecture Components

### 🟦 AWS Cloud, Region, VPC

-   **AWS Cloud:** Represents AWS environment.
-   **Region:** The geographic location hosting your resources.
-   **VPC:** Your isolated private network where all resources run.

------------------------------------------------------------------------

## 🌍 Internet Layer

### ✔ Internet Gateway (IGW)

Allows inbound/outbound internet traffic for **public subnets**.

### ✔ Public Load Balancer (ALB)

Distributes incoming user traffic across **Web Tier** EC2 instances.

------------------------------------------------------------------------

## 🟩 Web Tier (Public Tier)

### ✔ Public Subnets

Subnets connected to the internet through IGW.

### ✔ Auto Scaling Group (Web ASG)

Automatically scales web servers based on demand.

### ✔ EC2 Web Servers

Run NGINX/Apache or front-end applications.

### ✔ Web Security Group

-   Allows HTTP/HTTPS from the internet.
-   Allows outbound traffic to the App Tier.

------------------------------------------------------------------------

## 🟧 Application Tier (Private Tier)

### ✔ Private Subnets

Cannot access the internet directly.

### ✔ EC2 Application Servers

Contain business logic, backend services, or APIs.

### ✔ Internal Load Balancer

Routes traffic from Web Tier → App Tier.

### ✔ Auto Scaling Group (App ASG)

Ensures scalability based on backend utilization.

### ✔ App Security Group

Allows traffic only from Web Tier security group.

------------------------------------------------------------------------

## 🟦 Database Tier (Private & Secure)

### ✔ Private Subnets (DB Tier)

Highly restricted --- only the App Tier can reach them.

### ✔ Primary Database (M icon)

MySQL / MariaDB / PostgreSQL / Aurora.

### ✔ Read Replica (R icon)

Used for: - High availability - Failover - Read optimization

### ✔ DB Security Group

Allows traffic only from App Tier.

------------------------------------------------------------------------

## 🔀 NAT Gateway 

### ✔ Purpose

Provides **outbound internet** access for private subnets (App/DB)\
e.g., for updates, package downloads, API calls.

### ✔ Placement

-   Lives in **public subnet**
-   Each private subnet routes `0.0.0.0/0` → NAT Gateway

### ✔ High Availability

Best practice: **One NAT per AZ** to prevent cross-AZ latency/failure.

------------------------------------------------------------------------

## 🗂 Availability Zones

Resources are duplicated across: - **AZ 1A** - **AZ 1B**

This ensures high availability and fault tolerance for all tiers.

------------------------------------------------------------------------

## 🔒 Security Model

### Security Groups enforce:

-   **Web Tier:** Internet → Web only\
-   **App Tier:** Web → App only\
-   **DB Tier:** App → DB only

This ensures strong isolation & least-privilege access.

------------------------------------------------------------------------

## 📈 Summary

This architecture provides:

-   High availability (multi-AZ)
-   Scalability (auto scaling)
-   Strong security (private subnets, SGs)
-   Reliability (load balancers, replicas)
-   Controlled internet access (NAT Gateway)


