# Fastlane

Fastlane is a tool in ruby to release your iOS and Android app.

More info:
https://fastlane.tools/

In this iOS project we used to:

- Run Test
- Generate code coverage
- Generate snapshots
- Deploy to TestFlight beta version
- Deploy to App Store release
- Send message to telegram with success or fail

### How to use 

In Appfile is the configuration with package name and json key file

# Available Actions
## iOS
### ios test
```
fastlane ios test
```
Runs all the tests
### ios coverage
```
fastlane ios coverage
```
Run code coverage with xcov

### In the folder actions we add custom actions

- To send message to telegram

----

More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).