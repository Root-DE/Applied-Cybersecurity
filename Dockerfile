FROM ubuntu:22.04
RUN apt update; apt dist-upgrade -y
RUN apt install -y curl wget git zip

# Install Docker (for authenticating to private container registries)
RUN apt-get install -y docker docker.io containerd runc

# Install Syft
RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/bin

# Install Grype + update db
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/bin
RUN grype db update

# add send_script.sh
COPY send_script.sh /usr/bin/send_script.sh
RUN chmod +x /usr/bin/send_script.sh
