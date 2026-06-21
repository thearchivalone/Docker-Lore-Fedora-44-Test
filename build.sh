#!/bin/bash
cd /cache &&
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs >installer.sh &&
  chmod +x installer.sh &&
  ./installer.sh -y &&
  . "${HOME}/.cargo/env" &&
  rustup toolchain install stable &&
  rustup toolchain install nightly &&
  git clone --recursive --depth=1 https://github.com/EpicGames/lore.git &&
  cd lore &&
  uv tool install pre-commit &&
  ${HOME}/.local/bin/pre-commit install &&
  cargo build &&
  cargo test &&
  cargo +nightly fmt --all &&
  cargo clippy --all-targets -- -D warnings --no-deps &&
  cargo clean &&
  cd / &&
  rm -rf /cache/*
