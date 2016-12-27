If you want to support my open source projects financially, you can do so by purchasing a copy of [BrowserFreedom](https://getbrowserfreedom.com), [Mediunic](https://itunes.apple.com/app/mediunic-medium-client/id1088945121?mt=12) or sending Bitcoin to `3DH9B42m6k2A89hy1Diz3Vr3cpDNQTQCbJ` 😁

# GRCodeSignatureVerifier

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage) [![CocoaPods](https://img.shields.io/cocoapods/v/GRCodeSignatureVerifier.svg)]()

Simple code signature verification for macOS apps.

GRCodeSignatureVerifier can be used to check if an app has been tampered with by verifying its code signature.

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

### Using Carthage:

```
github "insidegui/GRCodeSignatureVerifier" ~> 1.0
```

### Using CocoaPods:

If you're unfamiliar with CocoaPods, read [using CocoaPods](http://guides.cocoapods.org/using/using-cocoapods.html).

Add the following line to your `Podfile`:

```ruby
pod 'GRCodeSignatureVerifier'
```

### Manually

#### Framework

Just download the code and add `GRCodeSignatureVerifier.framework` to the `Embedded Binaries` section of your app's target config.

#### Directly

Alternatively, you can just drop `GRCodeSignatureVerifier.h` and `GRCodeSignatureVerifier.m` in your app and use it directly.

## ❤️

[![Flattr this git repo](http://api.flattr.com/button/flattr-badge-large.png)](https://flattr.com/submit/auto?user_id=insidegui&url=https://github.com/insidegui/GRCodeSignatureVerifier.git)