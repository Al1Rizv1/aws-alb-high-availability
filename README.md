#  AWS High-Availability Web Application with Application Load Balancer (ALB)

A hands-on cloud project demonstrating how to deploy a fault-tolerant, highly available web architecture on AWS using **EC2**, **Application Load Balancers (ALB)**, and **Target Groups**. Traffic is dynamically routed in a round-robin fashion across two Linux web servers running Apache (`httpd`) in different Availability Zones.

---

##  Architecture Overview

```text
                      [ Internet Users ]
                              │
                              │ (HTTP / Port 80)
                              ▼
                ┌──────────────────────────┐
                │ Application Load Balancer│  <-- Public Security Group (alb-sg)
                │ (ali-app-load-balancer)  │      Allows Port 80 from 0.0.0.0/0
                └─────────────┬────────────┘
                              │
                              │ (Round-Robin Routing)
                              ▼
                ┌──────────────────────────┐
                │ Target Group (HTTP:80)   │  <-- Health Check: HTTP /
                │    (web-servers-tg)      │
                └──────┬────────────────┬──┘
                       │                │
                       ▼                ▼
             ┌──────────────────┐  ┌──────────────────┐
             │  EC2 Instance 1  │  │  EC2 Instance 2  │  <-- Private Security Group (web-server-sg)
             │ (Web-Server-1)   │  │ (Web-Server-2)   │      Allows Port 80 ONLY from alb-sg
             │    us-east-1c    │  │    us-east-1d    │
             └──────────────────┘  └──────────────────┘