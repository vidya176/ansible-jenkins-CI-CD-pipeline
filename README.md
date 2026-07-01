# End-to-End CI/CD Pipeline using Jenkins, Ansible, Nexus & Tomcat

## 📌 Project Overview

This project demonstrates the implementation of an end-to-end Continuous Integration and Continuous Deployment (CI/CD) pipeline for a Java web application using industry-standard DevOps tools.

The pipeline automates the complete software delivery lifecycle—from source code checkout to deployment—using Jenkins, Maven, Nexus Repository Manager, Ansible, and Apache Tomcat.

---

## 🚀 Project Objectives

- Automate the build process using Jenkins.
- Compile and package a Java application using Maven.
- Store build artifacts in Nexus Repository.
- Deploy the application automatically using Ansible.
- Support deployments to Development and Test environments.
- Reduce manual deployment effort and improve delivery speed.

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|------|---------|
| Git & GitHub | Source Code Management |
| Jenkins | CI/CD Automation |
| Maven | Build & Package Management |
| Ansible | Configuration Management & Deployment |
| Nexus Repository | Artifact Repository |
| Apache Tomcat | Application Server |
| Linux (Amazon Linux) | Operating System |
| SSH | Secure Communication |

---

## 🏗️ Infrastructure Setup

This project consists of the following servers:

| Server | Purpose |
|---------|---------|
| Ansible Control Node | Executes Playbooks |
| Jenkins Server | Runs CI/CD Pipeline |
| Nexus Server | Stores Artifacts |
| Dev Server 1 | Deployment Target |
| Dev Server 2 | Deployment Target |
| Test Server 1 | Deployment Target |
| Test Server 2 | Deployment Target |

---

## 🔄 CI/CD Workflow

1. Developer pushes source code to GitHub.
2. Jenkins checks out the latest code.
3. Maven compiles the application.
4. Unit tests are executed.
5. WAR artifact is generated.
6. Artifact is uploaded to Nexus Repository.
7. Manual approval is requested before deployment.
8. Jenkins triggers the Ansible Playbook.
9. Ansible copies the WAR file to the target Tomcat servers.
10. Application is successfully deployed.

---

## ⚙️ Jenkins Pipeline Stages

- Checkout
- Build
- Test
- Package Artifact
- Upload Artifact to Nexus
- Manual Approval
- Deploy using Ansible

---

## 📂 Repository Structure

```
ansible-jenkins-cicd-pipeline
│
├── README.md
├── Jenkinsfile
├── ansible
│   ├── hosts
│   ├── playbook.yml
│   └── tomcat.yml
│
├── scripts
│   ├── jenkins.sh
│   └── nexus.sh
│
├── configuration
│   ├── context.xml
│   └── tomcat-users.xml
│
├── images
│
└── docs
```

---

## 📋 Jenkins Parameters

### Branch

- main

### Environment

- dev
- test

---

## ✨ Key Features

- End-to-End CI/CD Automation
- Automated Maven Build
- Automated Testing
- Artifact Versioning
- Nexus Integration
- Ansible-based Deployment
- Parameterized Jenkins Pipeline
- Multi-Environment Deployment
- Manual Approval Before Production Deployment
- Centralized Artifact Repository

---

## 📁 Project Files

| File | Description |
|------|-------------|
| Jenkinsfile | Jenkins Pipeline Definition |
| hosts | Ansible Inventory |
| playbook.yml | Deploy WAR to Tomcat |
| tomcat.yml | Install & Configure Tomcat |
| jenkins.sh | Jenkins Installation Script |
| nexus.sh | Nexus Installation Script |
| context.xml | Tomcat Configuration |
| tomcat-users.xml | Tomcat User Configuration |

---

## 📸 Screenshots

Screenshots will be added for:

- Jenkins Dashboard
- Blue Ocean Pipeline
- Successful Build
- Nexus Repository
- Tomcat Deployment
- Ansible Playbook Execution
- Running Application

---

## 📚 Skills Demonstrated

- Jenkins Pipeline
- Ansible Automation
- Linux Administration
- Git & GitHub
- Maven
- Nexus Repository
- Apache Tomcat
- CI/CD Implementation
- Infrastructure Automation
- Shell Scripting

---

## 🔮 Future Enhancements

- Dockerize the application
- Deploy on Kubernetes
- Provision infrastructure using Terraform
- Deploy on AWS
