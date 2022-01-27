#!/bin/sh
set -e

currentBranch=${INPUT_CURRENT_BRANCH}
packageManager=${INPUT_PACKAGE_MANAGER:-yarn}
buildCommand=${INPUT_BUILD_COMMAND-yarn build}
pushBranchPrefix=${INPUT_PUSH_BRANCH_PREFIX:-action_push}
prBranch=${INPUT_PR_BRANCH:-master}
prTitle=${INPUT_PR_TITLE:-Pull request}

branch=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13 ; echo '')
pushBranchName=${pushBranchPrefix}_${branch}

git checkout -b "$pushBranchName"

$packageManager install
$buildCommand

# git configuration
git config --global user.name "${GITHUB_ACTOR}"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
export GITHUB_USER="${GITHUB_ACTOR}"

# build directory is usually included in the .gitignore file
# and for this reason it must be renamed to something else
mv build webapp_dist

# executing the git commands for committing and pushing to branch
git add webapp_dist
git commit -m "Github action: build"
git push origin "$pushBranchName"

echo "Diff"
diff=$(git diff --compact-summary --no-color "origin/${pushBranchName}...origin/${prBranch}")
diff=${diff:-prTitle}
echo "$diff"

hub pull-request -b "$pushBranchName" -h "$prBranch" -m "$diff" --no-edit
