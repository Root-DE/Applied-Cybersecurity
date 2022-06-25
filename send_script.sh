#!/bin/bash

repo_org=$GITHUB_REPOSITORY_OWNER
repo_name=$(echo $GITHUB_REPOSITORY | cut -d'/' -f2)
repo_url="https://github.com/$repo_org/$repo_name"

echo "{" > file.json
echo "  \"repo_org\": \"$repo_org\"," >> file.json
echo "  \"repo_name\": \"$repo_name\"," >> file.json
echo "  \"repo_url\": \"$repo_url\"" >> file.json
echo "}" >> file.json

curl -X POST -H "Content-Type: application/json" -d @file.json https://applied.root-tech.one/api/repo_notification/
