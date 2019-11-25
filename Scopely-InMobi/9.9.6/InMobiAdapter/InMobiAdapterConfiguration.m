//
//  InMobiAdapterConfiguration.m
//  InMobiMoPubSampleApp
//
//  Created by Iti Agrawal on 11/09/19.
//

#import "InMobiAdapterConfiguration.h"
#import "InMobiSDKInitialiser.h"
#if __has_include("MoPub.h")
    #import "MPLogging.h"
    #import "MPConstants.h"
#endif

#import <InMobiSDK/IMSdk.h>

#define InMobiMopubAdapterVersion @"1.0.0"
#define MopubNetworkName @"inmobi"
#define InMobiSDKVersion @"9.0.0"

@implementation InMobiAdapterConfiguration

#pragma mark - MPAdapterConfiguration

- (NSString *)adapterVersion {
    return InMobiMopubAdapterVersion;
}

- (NSString *)biddingToken {
    return nil;
}

- (NSString *)moPubNetworkName {
    return MopubNetworkName;
}

- (NSString *)networkSdkVersion {
    return [IMSdk getVersion];
}

- (void)initializeNetworkWithConfiguration:(NSDictionary<NSString *, id> *)configuration complete:(void(^)(NSError *))complete {
    NSError* error = nil;
    [InMobiSDKInitialiser initialiseSDK:[configuration valueForKey:kIMAccountID] withError:&error];
    if(error) {
        complete(error);
        MPLogInfo(@"Inmobi's adapter failed to initialise with error:%@",error);
    }
    else {
        complete(nil);
    }
    
}

@end
