#!/bin/bash

sudo apt update
sudo apt upgrade -y

# install apt-fast
# https://github.com/ilikenwf/apt-fast?tab=readme-ov-file#quick-install
/bin/bash -c "$(curl -sL https://git.io/vokNn)"

bash scripts/setup_docker.sh
bash scripts/setup_nvidia_container.sh
bash scripts/set_path.sh
