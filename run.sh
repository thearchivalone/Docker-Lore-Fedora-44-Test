#!/bin/bash
# NOTE: cache directory was added so that the docker container wouldn't run out of space; expect up to need around 30 GB of free space for it
mkdir -p cache
docker build . -t lore
docker run --rm -v ./cache:/cache -t lore
