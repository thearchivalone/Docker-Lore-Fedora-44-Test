#!/bin/bash
cd /cache
if [ ! -d "lore" ]; then
  git clone --recursive --depth=1 https://github.com/EpicGames/lore.git
fi
cd lore &&
  uv tool install pre-commit &&
  ${HOME}/.local/bin/pre-commit install &&
  cargo build &&
  cargo test &&
  cargo clippy --all-targets -- -D warnings --no-deps &&
  cargo clean &&
  cd / &&
  rm -rf /cache/*
