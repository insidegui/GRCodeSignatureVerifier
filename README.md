# GRCodeSignatureVerifier

Simple code signature verification for OS X apps.

GRCodeSignatureVerifier can be used to check if an app has been tampered with by verifying It's code signature.

[See demo app to learn more](https://github.com/insidegui/GRCodeSignatureVerifierDemo).

[Read the docs](http://cocoadocs.org/docsets/GRCodeSignatureVerifier).

## Installing

### Using CocoaPods:

Add a `Podfile` that contains at least the following information to the root of your app project, then do `pod install`.
If you're unfamiliar with CocoaPods, read [using CocoaPods](http://guides.cocoapods.org/using/using-cocoapods.html).

```ruby
platform :osx
pod 'GRCodeSignatureVerifier'
use_frameworks!
```

### Manually

#### Framework

Just download the code and add `GRCodeSignatureVerifier.framework` to the `Embedded Binaries` section of your app's target config.

#### Directly

Alternatively, you can just drop `GRCodeSignatureVerifier.h` and `GRCodeSignatureVerifier.m` in your app and use It directly.

## ❤️

[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=insidegui&url=https://github.com/insidegui/GRCodeSignatureVerifier.git)