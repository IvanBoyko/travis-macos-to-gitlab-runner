#!/usr/bin/env bash
#
# Script runs GitLab runner
# based on: https://docs.gitlab.com/runner/install/osx.html
#


set -eux


#
# Parameters default values
#

GITLAB_URL=${GITLAB_URL:-https://gitlab.com/}
RUNNER_NAME=${RUNNER_NAME:-$(hostname)}
GITLAB_RUNNER_TAG_LIST=${GITLAB_RUNNER_TAG_LIST:-macos}


#
# Main
#

sudo curl --output /usr/local/bin/gitlab-runner \
    https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-darwin-amd64

sudo chmod +x /usr/local/bin/gitlab-runner

gitlab-runner install

gitlab-runner register --non-interactive \
    --url $GITLAB_URL \
    --registration-token $GITLAB_REGISTRATION_TOKEN \
    --tag-list $GITLAB_RUNNER_TAG_LIST \
    --name $RUNNER_NAME \
    --executor shell

gitlab-runner run &

# stdout is required to avoid the Travis cancelling the build with message:
# > No output has been received in the last 10m0s, this potentially indicates a stalled build or something wrong with the build itself.
while (true); do date; sleep 60; done
