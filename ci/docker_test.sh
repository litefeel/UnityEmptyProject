#!/usr/bin/env bash

set -e

if [ -z "$UNITY_PROJECT_DIR" ]; then
  UNITY_PROJECT_DIR=$(pwd)
fi

echo "UNITY_PROJECT_DIR:$UNITY_PROJECT_DIR"

docker run \
  -e UNITY_LICENSE_CONTENT \
  -e TEST_PLATFORM \
  -e UNITY_USERNAME \
  -e UNITY_PASSWORD \
  -w /project/ \
  -v $UNITY_PROJECT_DIR:/project/ \
  $IMAGE_NAME \
  /bin/bash -c "/project/ci/before_script.sh && /project/ci/test.sh"