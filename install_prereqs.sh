#!/usr/bin/env bash

set -eux


brew update
brew upgrade carthage
gem install fastlane


# Smoke test
carthage version
fastlane --version
git --version
