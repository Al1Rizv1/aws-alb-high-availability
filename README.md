# 🚀 AWS High-Availability Web Architecture (Manual & Terraform IaC)

A complete cloud infrastructure project demonstrating how to design, deploy, and automate a fault-tolerant, highly available web application architecture across multiple Availability Zones on AWS. 

This repository covers both the initial **AWS Management Console** deployment and full **Infrastructure as Code (IaC) automation using Terraform**.

---

## 🏗️ Architecture Overview

```text
                        [ Internet Users ]
                                │
                                │ HTTP (Port 80)
                                ▼
                  ┌───────────────────────────┐
                  │ Application Load Balancer │  <-- Public Security Group (alb-sg)
                  │  (ali-app-load-balancer)  │      Allows Port 80 from 0.0.0.0/0
                  └─────────────┬─────────────┘
                                │
                                │ Round-Robin Routing
                                ▼
                  ┌───────────────────────────┐
                  │ Target Group (HTTP:80)    │  <-- Health Check: HTTP / (200 OK)
                  │    (web-servers-tg-tf)    │
                  └──────┬─────────────┬──────┘
                         │             │
                         ▼             ▼
               ┌──────────────────┐  ┌──────────────────┐
               │  EC2 Instance 1  │  │  EC2 Instance 2  │  <-- Private Security Group (web-server-sg)
               │ (Web-Server-1)   │  │ (Web-Server-2)   │      Allows Port 80 ONLY from alb-sg
               │    us-east-1c    │  │    us-east-1d    │
               └──────────────────┘  └──────────────────┘




