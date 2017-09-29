#!/bin/sh

#   Copyright © 2017 Teclib. All rights reserved.
#
# keychain_add.sh is part of FlyveMDMInventory
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
# @date      25/08/17
# @copyright Copyright © 2017 Teclib. All rights reserved.
# @license   Apache License, Version 2.0 https://www.apache.org/licenses/LICENSE-2.0
# @link      https://github.com/flyve-mdm/flyve-mdm-ios-inventory
# @link      https://flyve-mdm.com
# ------------------------------------------------------------------------------

echo ----------------- Decrypt custom keychain ------------------
# Decrypt custom keychain
openssl aes-256-cbc -k "$KEYCHAIN_PASSWORD" -in $CERTIFICATES_PATH/dist.cer.enc -d -a -out $CERTIFICATES_PATH/dist.cer
openssl aes-256-cbc -k "$KEYCHAIN_PASSWORD" -in $CERTIFICATES_PATH/dist.p12.enc -d -a -out $CERTIFICATES_PATH/dist.p12
echo -------------Create the keychain with a password -----------
# Create the keychain with a password
security create-keychain -p $KEYCHAIN_PASSWORD $KEYCHAIN_NAME
security add-certificates -k $KEYCHAIN_NAME $CERTIFICATES_PATH/apple.cer $CERTIFICATES_PATH/dist.cer
echo ------------ Make the custom keychain default, so xcodebuild will use it for signing -------------
# Make the custom keychain default, so xcodebuild will use it for signing
security list-keychains -d user -s $KEYCHAIN_NAME
security default-keychain -s $KEYCHAIN_NAME
echo ------------------- Unlock the keychain --------------------
# Unlock the keychain
security unlock-keychain -p $KEYCHAIN_PASSWORD $KEYCHAIN_NAME
echo ----- Set keychain timeout to 1 hour for long builds -------
# Set keychain timeout to 1 hour for long builds
# see http://www.egeek.me/2013/02/23/jenkins-and-xcode-user-interaction-is-not-allowed/
security set-keychain-settings -t 3600 -l ~/Library/Keychains/$KEYCHAIN_NAME
echo -------------- Add certificates to keychain ----------------
# Add certificates to keychain and allow codesign to access them
security import $CERTIFICATES_PATH/apple.cer -k ~/Library/Keychains/$KEYCHAIN_NAME -T /usr/bin/codesign
security import $CERTIFICATES_PATH/dist.cer -k ~/Library/Keychains/$KEYCHAIN_NAME -T /usr/bin/codesign
security import $CERTIFICATES_PATH/dist.p12 -k ~/Library/Keychains/$KEYCHAIN_NAME -P "$KEYCHAIN_PASSWORD" -T /usr/bin/codesign

security set-key-partition-list -S apple-tool:,apple: -s -k $KEYCHAIN_PASSWORD $KEYCHAIN_NAME