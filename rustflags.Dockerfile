# Reuse original lore docker container with a slight modification
FROM lore:latest
ENV RUSTFLAGS="--target=x86_64-linux-musl"
COPY build_repo.sh .
CMD [ "sh", "-c", "bash build_repo.sh" ]
