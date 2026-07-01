# End-to-End CI/CD Pipeline Setup Guide

## Overview

This document explains how to set up the complete CI/CD environment using Jenkins, Ansible, Nexus Repository, Maven, and Apache Tomcat.

---

# Architecture

```
                +--------------------+
                |     Developer      |
                +---------+----------+
                          |
                          v
                    GitHub Repository
                          |
                          v
                   Jenkins Pipeline
                          |
          +---------------+---------------+
          |                               |
          v                               v
     Maven Build                  Maven Test
          |
          v
     Package WAR
          |
          v
   Upload to Nexus Repository
          |
          v
     Manual Approval
          |
          v
     Execute Ansible Playbook
          |
      +---+------------------+
      |                      |
      v                      v
 Dev Environment       Test Environment
```

---

# Prerequisites

- AWS Account
- EC2 Instances
- Amazon Linux 2
- Java 17
- Git
- Maven
- SSH Access
- Internet Connectivity

---

# Infrastructure

| Server | Purpose |
|----------|---------------------------|
| Jenkins | CI/CD Server |
| Ansible | Control Node |
| Nexus | Artifact Repository |
| Dev-1 | Application Deployment |
| Dev-2 | Application Deployment |
| Test-1 | Application Deployment |
| Test-2 | Application Deployment |

---

# Step 1 – Configure All Servers

Update the hostname on each server.

```bash
sudo hostnamectl set-hostname <hostname>
```

Set a root password.

```bash
sudo passwd root
```

Enable password authentication.

Edit:

```
/etc/ssh/sshd_config
```

Uncomment:

```
PasswordAuthentication yes
PermitRootLogin yes
```

Restart SSH.

```bash
sudo systemctl restart sshd
```

---

# Step 2 – Install Ansible

Install Ansible on the Control Node.

```bash
sudo amazon-linux-extras install ansible2 -y

sudo yum install python3 python-pip -y
```

Verify installation.

```bash
ansible --version
```

---

# Step 3 – Configure Inventory

Create the inventory file.

```
/etc/ansible/hosts
```

Example:

```ini
[dev]
DEV_SERVER_IP
DEV_SERVER_IP

[test]
TEST_SERVER_IP
TEST_SERVER_IP
```

---

# Step 4 – Configure Passwordless SSH

Generate an SSH key.

```bash
ssh-keygen
```

Copy the key to every managed node.

```bash
ssh-copy-id root@DEV_SERVER

ssh-copy-id root@TEST_SERVER
```

Verify connectivity.

```bash
ansible all -m ping
```

Expected output:

```
SUCCESS
```

---

# Step 5 – Install Jenkins

Run the installation script.

```bash
sh scripts/jenkins.sh
```

Open Jenkins.

```
http://<JENKINS_PUBLIC_IP>:8080
```

Unlock Jenkins.

```bash
cat /var/lib/jenkins/secrets/initialAdminPassword
```

Install Suggested Plugins.

Create the Administrator account.

---

# Step 6 – Install Jenkins Plugins

Install the following plugins.

- Ansible
- Blue Ocean
- Nexus Artifact Uploader

---

# Step 7 – Configure Ansible in Jenkins

Navigate to

```
Manage Jenkins
```

↓

```
Global Tool Configuration
```

↓

```
Ansible
```

Provide

```
Name: ansible

Path:
/usr/bin
```

Save.

---

# Step 8 – Install Nexus Repository

Execute:

```bash
sh scripts/nexus.sh
```

Open

```
http://<NEXUS_PUBLIC_IP>:8081
```

Login as

```
admin
```

Retrieve the initial password.

```
/app/sonatype-work/nexus3/admin.password
```

Create a Maven Hosted Repository.

Deployment Policy:

```
Allow Redeploy
```

---

# Step 9 – Configure Apache Tomcat

Run the Ansible playbook.

```bash
ansible-playbook ansible/tomcat.yml
```

Verify Tomcat.

```
http://SERVER_IP:8080
```

---

# Step 10 – Create Jenkins Pipeline

Create a Pipeline Job.

Configure Git Repository.

Configure Branch Parameter.

Configure Environment Parameter.

Use the provided Jenkinsfile.

---

# Step 11 – Configure Nexus Upload

Use

```
Pipeline Syntax

↓

Nexus Artifact Uploader
```

Configure

- Nexus URL
- Repository
- Credentials
- Group ID
- Artifact ID
- Version

---

# Step 12 – Configure Ansible Deployment

Use

```
Pipeline Syntax

↓

Ansible Playbook
```

Configure

- Inventory
- Playbook
- Credentials

---

# Step 13 – Pipeline Flow

1. Checkout source code
2. Compile project
3. Execute unit tests
4. Package WAR
5. Upload artifact to Nexus
6. Manual approval
7. Deploy using Ansible
8. Application deployed to Tomcat


# Skills Demonstrated

- Jenkins Pipelines
- Git & GitHub
- Maven
- Linux Administration
- Ansible
- Apache Tomcat
- Nexus Repository
- CI/CD
- SSH
- Shell Scripting
