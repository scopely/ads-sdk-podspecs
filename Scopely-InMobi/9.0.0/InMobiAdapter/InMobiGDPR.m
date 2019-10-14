//
//  InMobiGDPR.m
//  InMobiMopubSampleApp
//
//  Created by Vineet Srivastava on 18/05/18.
//
//
#import "InMobiGDPR.h"

static NSString* GDPR=@"0";
static BOOL consent=false;

@implementation InMobiGDPR

+ (void)grantConsent {
    consent = true;
}

+ (void)revokeConsent {
    consent = false;
}

+ (void)isGDPRApplicable:(_Bool)flag {
    if(flag){
        GDPR = @"1";
    } else {
        GDPR = @"0";
    }
}

+ (BOOL)getConsent {
    return consent;
}

+ (NSString*)isGDPR {
    return GDPR;
}

@end
