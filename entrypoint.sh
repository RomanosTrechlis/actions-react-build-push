#!/bin/sh
set -e

currentBranch=${INPUT_CURRENT_BRANCH}
packageManager=${INPUT_PACKAGE_MANAGER:-yarn}
buildCommand=${INPUT_BUILD_COMMAND-yarn build}
pushBranchPrefix=${INPUT_PUSH_BRANCH_PREFIX:-action_push}
prBranch=${INPUT_PR_BRANCH:-master}
prTitle=${INPUT_PR_TITLE:-Pull request}

#echo "${packageManager}"
#echo "${buildCommand}"
#echo "${pushBranchPrefix}"
#echo "${prBranch}"
#echo "${prTitle}"
#echo "${prBody}"

hub version

exit

branch=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')
pushBranchName=${pushBranchPrefix}_${branch}

git checkout -b "$pushBranchName"

$packageManager install
$buildCommand

ls -lh

git add build
git commit -m "Github action: build"
git push origin "$pushBranchName"

prBody=git request-pull -p "$currentBranch" origin "$pushBranchName"
body=${INPUT_PR_BODY:-"$prBody"}

