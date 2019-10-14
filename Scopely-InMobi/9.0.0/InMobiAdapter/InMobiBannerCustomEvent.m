//
//  InMobiBannerCustomEvent.m
//  InMobi
//

#import "InMobiBannerCustomEvent.h"
#if __has_include(<MoPub/MoPub.h>)
    #import <MoPub/MoPub.h>
#elif __has_include(<MoPubSDKFramework/MoPub.h>)
    #import <MoPubSDKFramework/MoPub.h>
#else
    #import "MPConstants.h"
    #import "MPLogging.h"
#endif
#import "InMobiGDPR.h"
#import "InMobiSDKInitialiser.h"

#import <InMobiSDK/IMSdk.h>

@interface InMobiBannerCustomEvent () <CLLocationManagerDelegate>


@property (nonatomic, strong) IMBanner *bannerAd;
@property (nonatomic, strong) CLLocationManager *locationManager;

@end

@implementation InMobiBannerCustomEvent

#pragma mark - MPBannerCustomEvent Subclass Methods

- (void)requestAdWithSize:(CGSize)size customEventInfo:(NSDictionary *)info {
    
    MPLogEvent([MPLogEvent adLoadAttemptForAdapter:NSStringFromClass(self.class) dspCreativeId:nil dspName:nil]);
    if(![InMobiSDKInitialiser isSDKInitialised]){
        NSError* error= nil;
        [InMobiSDKInitialiser initialiseSDK:[info valueForKey:kIMAccountID] withError:&error];
        if(error) {
            MPLogInfo(@"Inmobi's adapter failed to initialise with error:%@. kindly pass correct accountID",error);
            [self.delegate bannerCustomEvent:self didFailToLoadAdWithError:(NSError *)error];
            return;
        }
    }
    CGRect frame = CGRectMake(0, 0, size.width, size.height);
    long long placementId = [[info valueForKey:kIMPlacementID] longLongValue];
    if(placementId <= 0) {
        NSError* error = [NSError errorWithDomain:kIMErrorDomain code:kIMIncorrectPlacemetID userInfo:@{NSLocalizedDescriptionKey: @"Inmobi's adapter failed to initialize because of invalid or empty PlacementId." }];
        [self.delegate bannerCustomEvent:self didFailToLoadAdWithError:error];
        return;
    }
    RUN_SYNC_ON_MAIN_THREAD(self.bannerAd = [[IMBanner alloc] initWithFrame:frame placementId:placementId];
    self.bannerAd.delegate = self;
    [self.bannerAd shouldAutoRefresh:NO];
    
     //Mandatory params to be set by the publisher to identify the supply source type
    NSMutableDictionary *paramsDict = [[NSMutableDictionary alloc] init];
    [paramsDict setObject:@"c_mopub" forKey:@"tp"];
	[paramsDict setObject:MP_SDK_VERSION forKey:@"tp-ver"];
    
    /*
     Sample for setting up the InMobi SDK Demographic params.
     Publisher need to set the values of params as they want.
     
     [IMSdk setAreaCode:@"1223"];
     [IMSdk setEducation:kIMSDKEducationHighSchoolOrLess];
     [IMSdk setGender:kIMSDKGenderMale];
     [IMSdk setAge:12];
     [IMSdk setPostalCode:@"234"];
     [IMSdk setLogLevel:kIMSDKLogLevelDebug];
     [IMSdk setLocationWithCity:@"BAN" state:@"KAN" country:@"IND"];
     [IMSdk setLanguage:@"ENG"];
     */
    self.bannerAd.extras = paramsDict;
    [self.bannerAd load];)
}

// Override this method to return NO to perform impression and click tracking manually.
- (BOOL)enableAutomaticImpressionAndClickTracking {
    return NO;
}

#pragma mark - IMBannerDelegate

-(void)bannerDidFinishLoading:(IMBanner*)banner {
    MPLogEvent([MPLogEvent adLoadSuccessForAdapter:NSStringFromClass(self.class)]);
    [self.delegate trackImpression];
    [self.delegate bannerCustomEvent:self didLoadAd:banner];
}

-(void)banner:(IMBanner*)banner didFailToLoadWithError:(IMRequestStatus*)error {
    MPLogEvent([MPLogEvent adLoadFailedForAdapter:NSStringFromClass(self.class) error:error]);
    [self.delegate bannerCustomEvent:self didFailToLoadAdWithError:(NSError *)error];
}

-(void)banner:(IMBanner*)banner didInteractWithParams:(NSDictionary*)params {
    MPLogEvent([MPLogEvent adTappedForAdapter:NSStringFromClass(self.class)]);
    [self.delegate trackClick];
}

-(void)userWillLeaveApplicationFromBanner:(IMBanner*)banner {
    MPLogEvent([MPLogEvent adWillLeaveApplicationForAdapter:NSStringFromClass(self.class)]);
    [self.delegate bannerCustomEventWillLeaveApplication:self];
}

-(void)bannerWillPresentScreen:(IMBanner*)banner {
    MPLogEvent([MPLogEvent adWillAppearForAdapter:NSStringFromClass(self.class)]);
    [self.delegate bannerCustomEventWillBeginAction:self];
}

-(void)bannerDidPresentScreen:(IMBanner*)banner {
    MPLogEvent([MPLogEvent adDidAppearForAdapter:NSStringFromClass(self.class)]);
}

-(void)bannerWillDismissScreen:(IMBanner*)banner {
    MPLogEvent([MPLogEvent adWillDisappearForAdapter:NSStringFromClass(self.class)]);
}

-(void)bannerDidDismissScreen:(IMBanner*)banner {
    MPLogEvent([MPLogEvent adDidDisappearForAdapter:NSStringFromClass(self.class)]);
    [self.delegate bannerCustomEventDidFinishAction:self];
}

-(void)banner:(IMBanner*)banner rewardActionCompletedWithRewards:(NSDictionary*)rewards {
    if(rewards!=nil){
        MPLogInfo(@"InMobi banner reward action completed with rewards: %@", [rewards description]);
    }
}

@end
