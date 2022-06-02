FROM ubuntu:22.04
RUN apt update; apt dist-upgrade -y
RUN apt install -y curl wget git

# Install Syft
RUN curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sh -s -- -b /usr/bin

# Install Grype + update db
RUN curl -sSfL https://raw.githubusercontent.com/anchore/grype/main/install.sh | sh -s -- -b /usr/bin
RUN grype db update
