#!/bin/bash

# Set GitHub API endpoint
API_ENDPOINT="https://api.github.com"

# Set repository name
REPO_NAME="kubernetes/kubernetes"

# List repositories
echo "Repositories:"
curl -s "$API_ENDPOINT/users/kubernetes/repos" | jq -r '.[].full_name'

# List users and groups
echo "Users:"
curl -s "$API_ENDPOINT/repos/$REPO_NAME/collaborators" | jq -r '.[].login'
echo "Groups:"
curl -s "$API_ENDPOINT/repos/$REPO_NAME/teams" | jq -r '.[].name'

# List issues
echo "Issues:"
curl -s "$API_ENDPOINT/repos/$REPO_NAME/issues" | jq -r '.[].title'

# List pull requests
echo "Pull Requests:"
curl -s "$API_ENDPOINT/repos/$REPO_NAME/pulls" | jq -r '.[].user.login'

# List push events
echo "Push Events:"
curl -s "$API_ENDPOINT/repos/$REPO_NAME/events" | jq -r '.[] | select(.type=="PushEvent") | .actor.login'

# output
# Repositories:
# kubernetes/apimachinery
# kubernetes/client-go
# kubernetes/kubectl
# kubernetes/minikube
# kubernetes/ingress-nginx
# ...

# Users:
# user1
# user2
# user3

# Groups:
# owners
# approvers
# viewers

# Issues:
# Issue 1
# Issue 2
# Issue 3

# Pull Requests:
# user1
# user2
# user3

# Push Events:
# user1
# user2
# user3
