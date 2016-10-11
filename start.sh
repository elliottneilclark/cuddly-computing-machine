#!/bin/bash
BASE_DIR=$(pushd `dirname "$0"` 2>&1 > /dev/null && pwd && popd  2>&1 > /dev/null)

if [[ $1 = "rebuild" ]]; then
  docker build --no-cache -t elliottneilclark/cuddly-computing-machine .
fi
docker run --security-opt seccomp:unconfined \
  -v ${BASE_DIR}/share/:/opt/share \
  -p 127.0.0.1:9090:9090 \
  -it elliottneilclark/cuddly-computing-machine /bin/bash
