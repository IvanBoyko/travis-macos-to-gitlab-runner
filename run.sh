#!/usr/bin/env bash

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

brew update
brew upgrade carthage
gem install fastlane


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

gitlab-runner run
