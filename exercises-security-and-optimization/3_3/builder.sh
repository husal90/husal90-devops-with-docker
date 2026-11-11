#!/bin/bash
# usage: ./builder.sh <github-repo> <docker-image>   e.g. ./builder.sh mluukkai/express_app mluukkai/testing
set -e

if [ $# -ne 2 ]; then
  echo "usage: $0 <github-repo> <docker-image>" >&2
  exit 1
fi

dir="$(mktemp -d)"
trap 'rm -rf "$dir"' EXIT

git clone "https://github.com/$1" "$dir"
docker build -t "$2" "$dir"
docker push "$2"
