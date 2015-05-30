FROM sameersbn/gitlab-ci-runner:latest
MAINTAINER ethan-liu@outlook.com

# Install Java.
RUN \
  echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
  apt-get update && \
  apt-get install -y python-software-properties && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer

# Install maven and git.
RUN apt-get install -y maven git
RUN apt-get clean

# Use the customize init file.
ADD assets/init /app/init
RUN chmod 755 /app/init

