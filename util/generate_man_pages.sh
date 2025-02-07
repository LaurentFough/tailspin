#!/bin/bash

set -e  # If any command fails, stop the script immediately

full_version=$(cargo run -- -V)
version_number=$(echo "$full_version" | awk '{print $2}')

touch spin.adoc

asciidoctor -b manpage spin.adoc \
  --destination=../man/ \
  --attribute release-version="$version_number"