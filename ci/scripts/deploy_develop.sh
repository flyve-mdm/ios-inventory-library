#!/bin/sh

#   Copyright © 2017 Teclib. All rights reserved.
#
# deploy_develop.sh is part of FlyveMDMInventory
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
# @date      08/09/17
# @copyright Copyright © 2017 Teclib. All rights reserved.
# @license   Apache License, Version 2.0 https://www.apache.org/licenses/LICENSE-2.0
# @link      https://github.com/flyve-mdm/flyve-mdm-ios-inventory
# @link      https://flyve-mdm.com
# ------------------------------------------------------------------------------

GITHUB_COMMIT_MESSAGE=$(git log --format=oneline -n 1 $CIRCLE_SHA1)

if [[ $GITHUB_COMMIT_MESSAGE != *"ci(release): generate CHANGELOG.md for version"* && $GITHUB_COMMIT_MESSAGE != *"ci(build): release version"* ]]; then

    # Generate CHANGELOG.md and increment version
    npm run release -- -t ''
    # Get version number from package.json
    export GIT_TAG=$(jq -r ".version" package.json)
    # Revert last commit
    git reset --hard HEAD~1
    # Update CFBundleShortVersionString
    /usr/libexec/PlistBuddy -c "Set :CFBundleShortVersionString ${GIT_TAG}" ${PWD}/${APPNAME}/Info.plist
    # Update CFBundleVersion
    /usr/libexec/PlistBuddy -c "Set :CFBundleVersion $CIRCLE_BUILD_NUM" ${PWD}/${APPNAME}/Info.plist
    # Add modified and delete files
    git add ${APPNAME}/Info.plist
    # Create commit
    git commit -m "ci(beta): generate **beta** for version ${GIT_TAG}"

    # Generate documentation with jazzy
    jazzy

    # Add docs folder
    git add docs -f
    # Create commit, NOTICE: this commit is not sent
    git commit -m "ci(docs): generate **docs** for version ${GIT_TAG}"

    # Generate code coverage reporting with xcov
    bundle exec fastlane coverage

    # Add coverage folder
    git add coverage -f
    # Create commit, NOTICE: this commit is not sent
    git commit -m "ci(docs): generate **coverage** for version ${GIT_TAG}"

    # Update documentation on gh-pages
    git branch -D gh-pages
    git fetch origin gh-pages
    git checkout gh-pages

    # Remove old documetation
    rm -rf docs
    rm -rf coverage

    git checkout $CIRCLE_BRANCH docs

    # Add docs folder
    git add docs
    # Create commit
    git commit -m "ci(docs): generate documentation with jazzy for version ${GIT_TAG}"

    # Get code coverage from develop branch
    git checkout $CIRCLE_BRANCH coverage
    # Add coverage folder
    git add coverage
    # Create commit
    git commit -m "ci(docs): generate coverage with xcov for version ${GIT_TAG}"

    # Create header content to cache
    echo "---" > header_cache
    echo "cache_version: $CIRCLE_SHA1" >> header_cache
    echo "---" >> header_cache
    # Remove header from file
    sed -e '1,3d' sw.js > cache_file
    rm sw.js
    # Add new header
    (cat header_cache ; cat cache_file) > sw.js
    # Remove temp files
    rm cache_file
    rm header_cache
    # Add sw.js to git
    git add -u
    # Create commit
    git commit -m "ci(cache): force update cache for version ${GIT_TAG}"

    # Push commit to origin gh-pages branch
    git push origin gh-pages

    git checkout $CIRCLE_BRANCH -f
fi
