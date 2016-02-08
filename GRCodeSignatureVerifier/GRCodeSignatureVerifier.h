//
//  GRCodeSignatureVerifier.h
//  GRCodeSignatureVerifier
//
//  Created by Guilherme Rambo on 07/02/16.
//  Copyright © 2016 Guilherme Rambo. All rights reserved.
//

#import <Foundation/Foundation.h>

/// GRCodeSignatureVerifier can be used to check if an app has been tampered with by verifying It's code signature
@interface GRCodeSignatureVerifier : NSObject

/// Returns a shared instance of the verifier
+ (__nonnull instancetype)sharedInstance;

/// The code requirements compiled as a binary data
@property (nonatomic, copy) NSData *__nullable codeRequirementsData;

/**
 @property codeRequirements
 @abstract The code requirements in text form (if codeRequirementsData is also set, It will be used instead)
 @discussion I recommend using at least the bundle identifier as a requirement:
 @example "identifier = com.mycompany.MyAppName"
 @warning If you want the signature verification to fail when resources are changed you MUST provide at least the identifier requirement, otherwise the verification will only fail when the app binary is changed
 @ref The code signing requirement language is documented here: https://developer.apple.com/library/mac/documentation/Security/Conceptual/CodeSigningGuide/RequirementLang/RequirementLang.html#//apple_ref/doc/uid/TP40005929-CH5-SW1
 @see codeRequirementsData
 */
@property (nonatomic, copy) NSString *__nullable codeRequirements;

/// Whether the app's code signature is valid or not
@property (nonatomic, readonly) BOOL isSignatureValid;

/// After validation, contains any errors returned by the validation system
@property (nonatomic, readonly) NSError *__nullable validationError;

/// Discards any previous verification results (forces the verification to be run again when isSignatureValid gets called)
- (void)invalidate;

@end
