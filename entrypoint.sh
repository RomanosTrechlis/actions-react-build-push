#!/bin/sh
set -e

packageManager=${INPUT_PACKAGE_MANAGER:-yarn}
buildCommand=${INPUT_BUILD_COMMAND-yarn build}
pushBranchPrefix=${INPUT_PUSH_BRANCH_PREFIX:-action_push}
prBranch=${INPUT_PR_BRANCH:-master}
prTitle=${INPUT_PR_TITLE:-Pull request}
prBody=${INPUT_PR_BODY:-Pull request}

echo "${packageManager}"
echo "${buildCommand}"
echo "${pushBranchPrefix}"
echo "${prBranch}"
echo "${prTitle}"
echo "${prBody}"
