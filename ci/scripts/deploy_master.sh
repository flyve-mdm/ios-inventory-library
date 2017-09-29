#!/bin/sh

#   Copyright © 2017 Teclib. All rights reserved.
#
# deploy_master.sh is part of FlyveMDMInventory
#
# FlyveMDMInventory is a subproject of Flyve MDM. Flyve MDM is a mobile
# device management software.
#
# FlyveMDMInventory is Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ------------------------------------------------------------------------------
# @author    Hector Rondon
# @date      09/09/17
# @copyright Copyright © 2017 Teclib. All rights reserved.
# @license   Apache License, Version 2.0 https://www.apache.org/licenses/LICENSE-2.0
# @link      https://github.com/flyve-mdm/flyve-mdm-ios-inventory
# @link      https://flyve-mdm.com
# ------------------------------------------------------------------------------

GH_COMMIT_MESSAGE=$(git log --format=oneline -n 1 $CIRCLE_SHA1)

if [[ $GH_COMMIT_MESSAGE != *"ci(release): generate CHANGELOG.md for version"* && $GH_COMMIT_MESSAGE != *"ci(build): release version"* ]]; then

    # Generate CHANGELOG.md and increment version
    npm run release -- -t '' -m "ci(release): generate CHANGELOG.md for version %s"
    # Get version number from package.json
    export GIT_TAG=$(jq -r ".version" package.json)
    # Update CFBundleShortVersionString
    /usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString ${GIT_TAG}" ${PWD}/${APPNAME}/Info.plist
    # Update CFBundleVersion
    /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $CIRCLE_BUILD_NUM" ${PWD}/${APPNAME}/Info.plist
    # Increment podspec version
    podspec-bump -i ${GIT_TAG} -w
    # Add modified and delete files
    git add -u
    # Create commit
    git commit -m "ci(build): release version ${GIT_TAG}"
    # Push commits and tags to origin branch
    git push --follow-tags origin $CIRCLE_BRANCH
    # Create release with conventional-github-releaser
    conventional-github-releaser -t $GH_TOKEN
    # Create zip example code
    zip -r $CIRCLE_ARTIFACTS/app_example_code.zip Example/*
    # Update release name
    github-release edit \
    --user $CIRCLE_PROJECT_USERNAME \
    --repo $CIRCLE_PROJECT_REPONAME \
    --tag ${GIT_TAG} \
    --name "Inventory Engine v${GIT_TAG}" \
    # Upload example code release
    github-release upload \
    --user $CIRCLE_PROJECT_USERNAME \
    --repo $CIRCLE_PROJECT_REPONAME \
    --tag ${GIT_TAG} \
    --name "example.zip" \
    --file $CIRCLE_ARTIFACTS/app_example_code.zip

    # Update CHANGELOG.md on gh-pages
    git branch -D gh-pages
    git fetch origin gh-pages
    git checkout gh-pages
    git checkout $CIRCLE_BRANCH CHANGELOG.md

    # Create header content to CHANGELOG.md
    echo "---" > header.md
    echo "layout: modal" >> header.md
    echo "title: changelog" >> header.md
    echo "---" >> header.md

    # Duplicate CHANGELOG.md
    cp CHANGELOG.md CHANGELOG_COPY.md
    # Add header to CHANGELOG.md
    (cat header.md ; cat CHANGELOG_COPY.md) > CHANGELOG.md
    # Remove CHANGELOG_COPY.md
    rm CHANGELOG_COPY.md
    rm header.md

    # Add CHANGELOG.md
    git add CHANGELOG.md
    # Create commit
    git commit -m "ci(docs): generate CHANGELOG.md for version ${GIT_TAG}"
    # Push commit to origin gh-pages branch
    git push origin gh-pages

    # Checkout to release branch
    git checkout $CIRCLE_BRANCH -f
fi
