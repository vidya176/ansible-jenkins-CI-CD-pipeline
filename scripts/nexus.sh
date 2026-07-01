# STEP-1: CREATE EC2 INSTANCE
# OS            : Amazon Linux 2023
# Instance Type : t2.micro (t3.micro recommended)
# Storage       : 30 GB
# Security Group:
#   SSH   : 22
#   Nexus : 8081
# STEP-2: UPDATE SERVER
sudo dnf update -y
# STEP-3: INSTALL JAVA 21, WGET & TAR
sudo dnf install java-21-amazon-corretto-devel wget tar -y
# Verify Java
java -version
# STEP-4: DOWNLOAD LATEST NEXUS
cd /opt
sudo wget https://download.sonatype.com/nexus/3/latest-unix.tar.gz
# STEP-5: EXTRACT
sudo tar -xzf latest-unix.tar.gz
# STEP-6: CHANGE OWNERSHIP
sudo chown -R nexus:nexus /opt/nexus
# STEP-7: CONFIGURE NEXUS TO RUN AS nexus USER
sudo sed -i 's/#run_as_user=""/run_as_user="nexus"/' /opt/nexus/bin/nexus.rc
# STEP-8: START NEXUS
sudo -u nexus /opt/nexus/bin/nexus start
# Check status
sudo -u nexus /opt/nexus/bin/nexus status
# STEP-9: GET INITIAL PASSWORD
sudo cat /opt/sonatype-work/nexus3/admin.password
