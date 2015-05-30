#Introduction

Dockerfile to build a GitLab CI Runner with Oralce JDK7, maven, git from sameersbn/gitlab-ci-runner base image.
Installed Java7, maven, git.

#Installation

Pull the latest version of the image from the docker index. This is the recommended method of installation as it is easier to update image in the future. These builds are performed by the Docker Trusted Build service.

```bash
docker pull lxitgto/gitlab-runner-jdk7-maven:latest
```

Alternately you can build the image yourself.

```bash
git clone https://github.com/lxitgto/docker-gitlab-runner-jdk7-maven.git
cd docker-gitlab-runner-jdk7-maven
docker build --tag="$USER/gitlab-runner-jdk7-maven" .
```
# Quick Start
For a runner to do its trick, it has to first be registered/authorized on the GitLab CI server. This can be done by running the image with the **app:setup** command.

```bash
mkdir -p /opt/gitlab-runner-jdk7-maven
docker run --name gitlab-runner-jdk7-maven -it --rm \
	-v /opt/gitlab-runner-jdk7-maven:/home/gitlab_ci_runner/data \
  lxitgto/gitlab-runner-jdk7-maven:1.0 app:setup
```

The command will prompt you to specify the location of the GitLab CI server and provide the registration token to access the server. With this out of the way the image is ready, lets get is started.

```bash
docker run --name gitlab-runner-jdk7-maven -P -d \
	-v /opt/gitlab-runner-jdk7-maven:/home/gitlab_ci_runner/data \
	lxitgto/gitlab-runner-jdk7-maven:1.0
```

# Configuration

## Data Store
GitLab CI Runner saves the configuration for connection and access to the GitLab CI server. In addition, SSH keys are generated as well. To make sure this configuration is not lost when when the container is stopped/deleted, we should mount a data store volume at

* /home/gitlab_ci_runner/data

Volumes can be mounted in docker by specifying the **'-v'** option in the docker run command.

```bash
mkdir /opt/gitlab-runner-jdk-maven
docker run --name gitlab-runner-jdk-maven -d -h gitlab-ci-runner.local.host \
  -v /opt/gitlab-runner-jdk-maven:/home/gitlab_ci_runner/data \
  lemonbar/gitlab-runner-jdk-maven:1.0
```
