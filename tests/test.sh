#!/bin/bash
#
# Test the image.
#
set -e

BASE="$(pwd)"

echo "Get the latest alpine"
docker pull alpine

echo "Build the image"
docker build -t local-dcycle-httrack-image .

echo "Create local mock websites"
cd "$BASE/tests" && docker-compose up -d --build

echo "Run the image"
for website in \
  website_one \
  website_two \
; do
  docker run --network dcycle_docker_httrack_selftest --rm -v \
    "$(pwd)/websites/$website:/websites/$website" local-dcycle-httrack-image \
    "http://$website"
done

echo "Destroy the local mock websites"
cd "$BASE/tests" && docker-compose down

echo "See if the sites were correctly cloned"
ls -lah "$BASE"/tests/websites/website_one/image/image.jpg
ls -lah "$BASE"/tests/websites/website_two/image/image.jpg
ls -lah "$BASE"/tests/websites/website_one/page-2.html
ls -lah "$BASE"/tests/websites/website_two/page-2.html

echo "Remove the ./websites directory"
rm -rf "$BASE"/tests/websites

cd "$BASE"

echo ""
echo "All tests passing!"
echo ""
