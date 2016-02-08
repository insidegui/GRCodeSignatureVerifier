# GRCodeSignatureVerifier

Simple code signature verification for OS X apps.

GRCodeSignatureVerifier can be used to check if an app has been tampered with by verifying It's code signature.

[See demo app to learn more](https://github.com/insidegui/GRCodeSignatureVerifierDemo).

[Read the docs](http://cocoadocs.org/docsets/GRCodeSignatureVerifier).

## Example

### Swift
```swift
let verifier = GRCodeSignatureVerifier.sharedInstance()
	
// requirements are optional, but they make the verification stronger
verifier.codeRequirements = "identifier = \"com.yourcompany.AppName\""
	
if !verifier.isSignatureValid {
	NSLog("The app was modified. Exiting... \(verifier.validationError)")
	exit(1)
}
```

### Objective-C
```objc
GRCodeSignatureVerifier *verifier = [GRCodeSignatureVerifier sharedInstance];

verifier.codeRequirements = @"identifier = \"com.yourcompany.AppName\"";

if (!verifier.isSignatureValid) {
	NSLog("The app was modified. Exiting... %@", verifier.validationError);
	exit(1);
}
```
## Precompiled code requirements

You can use the tool `csreq` to compile code requirements:

```shell
$ csreq -r requirements.txt -b requirements.bin
```

To use precompiled code requirements you set the `codeRequirementsData` property:

```objc
verifier.codeRequirementsData = [NSData dataWithContentsOfFile:@"/path/to/requirements.bin"];
```
To learn more about what are code requirements and the code requirements language, [check out this document from Apple](https://developer.apple.com/library/mac/documentation/Security/Conceptual/CodeSigningGuide/RequirementLang/RequirementLang.html#//apple_ref/doc/uid/TP40005929-CH5-SW1).

## Installing

### Using CocoaPods:

Add a `Podfile` that contains at least the following information to the root of your app project, then do `pod install`.
If you're unfamiliar with CocoaPods, read [using CocoaPods](http://guides.cocoapods.org/using/using-cocoapods.html).

```ruby
platform :osx, "10.11"
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