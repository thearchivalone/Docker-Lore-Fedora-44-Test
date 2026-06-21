FROM fedora:44 AS base
ENV HOME /root
RUN dnf install -y git \
  clang21 \
  uv \
  curl \
  rust \
  clippy \
  cargo && \
  dnf clean all
COPY build_repo.sh .
CMD [ "sh", "-c", "bash build_repo.sh" ]
