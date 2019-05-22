#!/usr/bin/env bash

set -e

if [ -z "$UNITY_PROJECT_DIR" ]; then
  UNITY_PROJECT_DIR=$(pwd)
fi

echo "UNITY_PROJECT_DIR:$UNITY_PROJECT_DIR"

docker run \
  -e BUILD_NAME \
  -e UNITY_LICENSE_CONTENT \
  -e BUILD_TARGET \
  -e UNITY_USERNAME \
  -e UNITY_PASSWORD \
  -w /project/ \
  -v $UNITY_PROJECT_DIR:/project/ \
  $IMAGE_NAME \
  /bin/bash -c "/project/ci/before_script.sh && /project/ci/build.sh"