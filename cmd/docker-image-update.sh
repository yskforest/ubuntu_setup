#!/bin/bash

docker images --format "{{.Repository}}:{{.Tag}}" | grep -v "<none>" | xargs -L 1 docker pull | tee update_all.log
