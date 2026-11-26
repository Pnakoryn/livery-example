#!/bin/sh
# Print the last tag and one line per commit since it (or since the tag or commit given as $1).
set -eu
from=${1:-$(git describe --tags --abbrev=0 2>/dev/null || true)}
if [ -z "$from" ]; then
  echo "no tag yet: all commits"
  git log --no-merges --format='%h %s'
else
  echo "since $from"
  git log --no-merges --format='%h %s' "$from"..HEAD
fi
