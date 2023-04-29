FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk apache2 curl systemctl
RUN curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null && \
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null && \
apt-get update && \
apt-get install jenkins -y
RUN apt-get clean
EXPOSE 8080 80
CMD systemctl restart jenkins && /usr/sbin/apache2ctl -D FOREGROUND
