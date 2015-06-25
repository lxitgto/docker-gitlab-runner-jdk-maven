FROM sameersbn/gitlab-ci-runner:latest
MAINTAINER ethan-liu@outlook.com

# Install Ice 3.5.1
RUN \
  wget https://zeroc.com/download/RPM-GPG-KEY-zeroc-release && \
  apt-key add RPM-GPG-KEY-zeroc-release && \
  apt-get update && \
  wget https://zeroc.com/download/Ice/3.5/ubuntu/ice3.5-trusty.list -O /etc/apt/sources.list.d/ice3.5-trusty.list && \
  apt-get update && \
  apt-get install -y ice

# Use the customize init file.
ADD assets/init /app/init
RUN chmod 755 /app/init

