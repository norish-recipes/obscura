#!/usr/bin/env bash
# Usage: ./apply-patches.sh <upstream tag> <dir>
# Clones upstream Obscura at the tag into <dir> and applies patches/*.patch on top, in order.
set -euo pipefail

tag="$1"
dir="$2"

git clone --quiet --depth 1 --branch "$tag" "https://github.com/${UPSTREAM_REPO:-h4ckf0r0day/obscura}.git" "$dir"
git -C "$dir" -c user.name="Norish" -c user.email="noreply@norish.dev" \
  am --quiet --3way "$PWD"/patches/*.patch
