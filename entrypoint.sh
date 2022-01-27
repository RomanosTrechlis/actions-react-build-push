#!/bin/sh
set -e

echo "${INPUT_PACKAGE_MANAGER}"
echo "${INPUT_BUILD_COMMAND}"
echo "${INPUT_PUSH_BRANCH_PREFIX}"
echo "${INPUT_PR_BRANCH}"
echo "${INPUT_PR_TITLE}"
echo "${INPUT_PR_BODY}"

cmd "$(git -v)"
cmd "$(yarn -v)"
cmd "$(npm -v)"