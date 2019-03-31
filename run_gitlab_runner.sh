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

type cd
unset cd
echo 'unset cd' >> ~/.bashrc
type cd

gitlab-runner --debug run &

# Travis has timeouts: https://docs.travis-ci.com/user/customizing-the-build/#build-timeouts
#   * When a job produces no log output for 10 minutes.
#   * When a job on a public repository takes longer than 50 minutes.
#   * When a job on a private repository takes longer than 120 minutes.
#
# Let's keep printing to stdout:
while (true); do date; sleep 60; done
