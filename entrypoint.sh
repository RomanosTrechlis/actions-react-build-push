#!/bin/sh
set -e

packageManager='yarn'
buildCommand='yarn build'
pushBranchPrefix='action_push'
prBranch='master'
prTitle='Pull request'
prBody='Pull request'

echo "${packageManager}"
echo "${buildCommand}"
echo "${pushBranchPrefix}"
echo "${prBranch}"
echo "${prTitle}"
echo "${prBody}"

if [ -z ${INPUT_PACKAGE_MANAGER+x} ]; then
  packageManager="${INPUT_PACKAGE_MANAGER}";
fi
if [ -z ${INPUT_BUILD_COMMAND+x} ]; then
  buildCommand="${INPUT_BUILD_COMMAND}";
fi
if [ -z ${INPUT_PUSH_BRANCH_PREFIX+x} ]; then
  pushBranchPrefix="${INPUT_PACKAGE_MANAGER}";
fi
if [ -z ${INPUT_PR_BRANCH+x} ]; then
  prBranch="${INPUT_PR_BRANCH}";
fi
if [ -z ${INPUT_PR_TITLE+x} ]; then
  prTitle="${INPUT_PR_TITLE}";
fi
if [ -z ${INPUT_PR_BODY+x} ]; then
  prBody="${INPUT_PR_BODY}";
fi


echo "${packageManager}"
echo "${buildCommand}"
echo "${pushBranchPrefix}"
echo "${prBranch}"
echo "${prTitle}"
echo "${prBody}"

