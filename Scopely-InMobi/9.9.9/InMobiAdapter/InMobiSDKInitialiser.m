//
//  InMobiSDKInitialiser.m
//  InMobiMoPubSampleApp
//
//  Created by Ankit Pandey on 05/06/19.
//

#import "InMobiSDKInitialiser.h"
#import "InMobiGDPR.h"
#import <InMobiSDK/IMSdk.h>

NSString * const kIMErrorDomain = @"com.inmobi.mopubcustomevent.iossdk";
NSString * const kIMPlacementID = @"placementid";
NSString * const kIMAccountID = @"accountid";

@implementation InMobiSDKInitialiser

static BOOL isAccountInitialised = false;

+ (void)initialiseSDK:(NSString *)accountId withError:(NSError **)error {
    if(isAccountInitialised) {
        return;
    }
    
    accountId = [accountId stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if(accountId == nil || ![InMobiSDKInitialiser isValidAccountID:accountId]) {
        NSError* err = [NSError errorWithDomain:kIMErrorDomain code:kIMIncorrectAccountID userInfo:@{ NSLocalizedDescriptionKey: @"Inmobi's adapter failed to initialize because of invalid or empty accountId.."}];
        *error = err;
    }
    else {
        NSDictionary *gdprConsentObject = [InMobiGDPR getGDPRConsentDictionary];
        //InMobi SDK initialization with the account id setup @Mopub dashboard
        RUN_SYNC_ON_MAIN_THREAD([IMSdk initWithAccountID:accountId consentDictionary:gdprConsentObject];)
        isAccountInitialised = true;
    }
}

+ (BOOL)isValidAccountID:(NSString *)accountID {
    if ([accountID isKindOfClass:[NSString class]] && ([accountID length] == 32 || [accountID length] == 36)) {
        return YES;
    }
    return NO;
}

+ (BOOL)isSDKInitialised {
    return isAccountInitialised;
}

+ (void)updateGDPRConsent {
    [IMSdk updateGDPRConsent:[InMobiGDPR getGDPRConsentDictionary]];
}

@end
