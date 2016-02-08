//
//  GRCodeSignatureVerifier.m
//  Code Signature Verification Demo
//
//  Created by Guilherme Rambo on 07/02/16.
//  Copyright © 2016 Guilherme Rambo. All rights reserved.
//

#import "GRCodeSignatureVerifier.h"

@implementation GRCodeSignatureVerifier
{
    CFErrorRef _secError;
    BOOL _isValid;
    BOOL _dirty;
}

+ (instancetype)sharedInstance
{
    static GRCodeSignatureVerifier *_shared;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[GRCodeSignatureVerifier alloc] init];
    });
    
    return _shared;
}

- (instancetype)init
{
    self = [super init];
    
    [self invalidate];
    
    return self;
}

- (BOOL)__verify
{
    SecCodeRef code;
    if (SecCodeCopySelf(kSecCSDefaultFlags, &code) != 0) return NO;
    
    SecStaticCodeRef staticCode;
    if (SecCodeCopyStaticCode(code, kSecCSDefaultFlags, &staticCode) != 0) return NO;
    
    SecRequirementRef req = NULL;
    if (self.codeRequirements) {
        if (SecRequirementCreateWithString((__bridge CFStringRef)_codeRequirements, kSecCSDefaultFlags, &req) != 0) {
            NSLog(@"[GRCodeSignatureVerifier] WARNING: unable to compile code requirements from string %@", _codeRequirements);
        }
    }
    if (self.codeRequirementsData) {
        if (SecRequirementCreateWithData((__bridge CFDataRef)_codeRequirementsData, kSecCSDefaultFlags, &req) != 0) {
            NSLog(@"[GRCodeSignatureVerifier] WARNING: unable to get code requirements from data (data length = %lu)", _codeRequirementsData.length);
        }
    }
    
    return (SecCodeCheckValidityWithErrors(code, kSecCSDefaultFlags, req, &_secError) == 0) && (SecStaticCodeCheckValidity(staticCode, kSecCSDefaultFlags, req) == 0);
}

- (BOOL)isSignatureValid
{
    if (!_dirty) return _isValid;
    
    _isValid = [self __verify];

    return _isValid;
}

- (void)invalidate
{
    _dirty = YES;
    _isValid = NO;
}

- (NSError *)validationError
{
    return (__bridge NSError *)_secError;
}

@end
