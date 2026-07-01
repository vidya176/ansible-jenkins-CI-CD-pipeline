sudo dnf update -y
sudo dnf install ansible -y
sudo dnf install python3 python3-pip -y
# STEP-1: UPDATE THE SERVER
sudo dnf update -y
# STEP-2: INSTALL GIT, JAVA 17, MAVEN & WGET
sudo dnf install git dnf install java-21-amazon-corretto -y maven wget -y
# Verify installations
git --version
java -version
mvn -version
# STEP-3: ADD JENKINS REPOSITORY
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# STEP-4: INSTALL JENKINS
sudo dnf install jenkins -y
# STEP-5: ENABLE & START JENKINS
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins
# STEP-6: GET JENKINS INITIAL ADMIN PASSWORD
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
# STEP-7: VERIFY INSTALLATION
jenkins --version
java -version
git --version
mvn --version
