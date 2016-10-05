#!/bin/bash
BASE_DIR=$(pushd `dirname "$0"` 2>&1 > /dev/null && pwd && popd  2>&1 > /dev/null)

#docker build -t elliottneilclark/cuddly-computing-machine .
docker run --security-opt seccomp:unconfined \
  -v ${BASE_DIR}/share/:/opt/scratch \
  -p 8080:80 \
  -it elliottneilclark/cuddly-computing-machine /bin/bash
