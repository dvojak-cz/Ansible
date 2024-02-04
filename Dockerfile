FROM debian:12 AS base
WORKDIR /usr/local/bin
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y sudo ansible-core && \
    apt-get -y clean && \
    apt-get -y autoclean && \
    rm -rf /var/lib/apt/lists/*


FROM base AS jan
ARG TAGS
RUN addgroup --gid 1000 jan
RUN adduser --gecos jan --uid 1000 --gid 1000 --disabled-password jan
RUN echo "jan ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
USER jan
WORKDIR /home/jan

ENV HOME /home/jan

FROM jan
RUN mkdir /home/jan/ansible
VOLUME /home/jan/ansible
#RUN ansible-galaxy install -r requirements.yml
CMD ["sh", "-c", "ansible-playbook --vault-password-file ansible/password.cfg ansible/local.yml"]

