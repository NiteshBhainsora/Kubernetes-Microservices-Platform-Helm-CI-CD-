# Kubernetes Microservices Platform (Helm + CI/CD)

## Overview
This repository demonstrates a production-style Kubernetes deployment using Helm and a CI/CD pipeline.  
It focuses on system design, high availability, and deployment best practices rather than application code.

## High-Level Architecture

- Frontend and backend are stateless and horizontally scalable
- Database is stateful and uses persistent storage
- NGINX Ingress is the single entry point to the cluster

## Technology Stack
- Kubernetes
- Helm
- Jenkins CI/CD
- NGINX Ingress Controller
- Docker
- PostgreSQL
- Redis

## Repository Structure
.
├── docs/architecture.md
├── helm/platform/
│ ├── Chart.yaml
│ ├── values.yaml
│ └── templates/
├── docker/
│ ├── backend.Dockerfile
│ └── frontend.Dockerfile
├── ci-cd/Jenkinsfile
└── README.md


## Deployment Strategy
- All Kubernetes resources are managed using Helm
- CI/CD pipeline builds Docker images and pushes them to a registry
- Application and ingress controller are installed/updated via Helm
- Supports versioned releases and rollbacks

## CI/CD Flow
GitHub Commit
↓
Jenkins Pipeline
→ Build & Test
→ Build Docker Images
→ Push Images
→ Install / Upgrade NGINX Ingress (Helm)
→ Deploy Application (Helm)


## High Availability & Scalability
- Multiple replicas for frontend and backend services
- Kubernetes Services provide load balancing
- Designed for Horizontal Pod Autoscaler (HPA)
- Stateless services enable zero-downtime rolling updates

## Design Principles
- Infrastructure as Code
- Declarative deployments
- Separation of concerns
- Immutable builds
- Stateless application design

## Scope
Included:
- Kubernetes + Helm deployment
- CI/CD pipeline configuration
- High availability design

Out of scope:
- Multi-region setup
- Database sharding
- Service mesh
- Full observability stack
