FROM fedora:44 AS base
ENV HOME /root
RUN dnf install -y git \
  clang21 \
  uv \
  curl && \
  dnf clean all
COPY build.sh .
CMD [ "sh", "-c", "bash build.sh" ]
