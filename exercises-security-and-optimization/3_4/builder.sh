#!/bin/sh
# usage: builder.sh <github-repo> <docker-image>; needs DOCKER_USER and DOCKER_PWD in the environment
set -e

if [ $# -ne 2 ]; then
  echo "usage: $0 <github-repo> <docker-image>" >&2
  exit 1
fi

dir="$(mktemp -d)"
trap 'rm -rf "$dir"' EXIT

git clone "https://github.com/$1" "$dir"
docker build -t "$2" "$dir"
echo "$DOCKER_PWD" | docker login -u "$DOCKER_USER" --password-stdin
docker push "$2"
