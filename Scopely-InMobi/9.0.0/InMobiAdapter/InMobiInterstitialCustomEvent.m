//
//  InMobiInterstitialCustomEvent.m
//  InMobi
//

#import "InMobiInterstitialCustomEvent.h"
#if __has_include(<MoPub/MoPub.h>)
    #import <MoPub/MoPub.h>
#elif __has_include(<MoPubSDKFramework/MoPub.h>)
    #import <MoPubSDKFramework/MoPub.h>
#else
    #import "MPLogging.h"
    #import "MPConstants.h"
#endif

#import <InMobiSDK/IMSdk.h>

#import "InMobiGDPR.h"
#import "InMobiSDKInitialiser.h"

@interface InMobiInterstitialCustomEvent ()

@property (nonatomic, strong) IMInterstitial *interstitialAd;

@end

@implementation InMobiInterstitialCustomEvent

#pragma mark - MPInterstitialCustomEvent Subclass Methods

- (void)requestInterstitialWithCustomEventInfo:(NSDictionary *)info {
    MPLogInfo(@"Requesting InMobi interstitial");
    if(![InMobiSDKInitialiser isSDKInitialised]){
        NSError* error = nil;
        [InMobiSDKInitialiser initialiseSDK:[info valueForKey:kIMAccountID] withError:&error];
        if(error) {
            MPLogInfo(@"Inmobi's adapter failed to initialise with error:%@. kindly pass correct accountID",error);
            [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:(NSError *)error];
            return;
        }
    }
    
    long long placementId = [[info valueForKey:kIMPlacementID] longLongValue];
    if(placementId <= 0) {
        NSError* error = [NSError errorWithDomain:kIMErrorDomain code:kIMIncorrectPlacemetID userInfo:@{NSLocalizedDescriptionKey: @"Intestitial initialization skipped. The placementID is incorrect." }];
        [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:error];
        return;
    }
    self.interstitialAd = [[IMInterstitial alloc] initWithPlacementId:placementId];
    self.interstitialAd.delegate = self;

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

    self.interstitialAd.extras = paramsDict; // For supply source identification
    RUN_SYNC_ON_MAIN_THREAD([self.interstitialAd load];)
}

- (void)showInterstitialFromRootViewController:(UIViewController *)rootViewController {
    [self.interstitialAd showFromViewController:rootViewController withAnimation:kIMInterstitialAnimationTypeCoverVertical];
}

#pragma mark - IMInterstitialDelegate

-(void)interstitialDidFinishLoading:(IMInterstitial*)interstitial {
    MPLogEvent([MPLogEvent adLoadSuccessForAdapter:NSStringFromClass(self.class)]);
    [self.delegate interstitialCustomEvent:self didLoadAd:interstitial];
}

-(void)interstitialDidReceiveAd:(IMInterstitial *)interstitial{
    MPLogInfo(@"[InMobi] InMobi Ad Server responded with an Interstitial ad");
}

-(void)interstitial:(IMInterstitial*)interstitial didFailToLoadWithError:(IMRequestStatus*)error {
    MPLogEvent([MPLogEvent adLoadFailedForAdapter:NSStringFromClass(self.class) error:error]);
    [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:(NSError *)error];
}

-(void)interstitialWillPresent:(IMInterstitial*)interstitial {
    MPLogEvent([MPLogEvent adWillAppearForAdapter:NSStringFromClass(self.class)]);
    [self.delegate interstitialCustomEventWillAppear:self];
}

-(void)interstitialDidPresent:(IMInterstitial *)interstitial {
    MPLogEvent([MPLogEvent adDidAppearForAdapter:NSStringFromClass(self.class)]);
    [self.delegate trackImpression];
    [self.delegate interstitialCustomEventDidAppear:self];
}

-(void)interstitial:(IMInterstitial*)interstitial didFailToPresentWithError:(IMRequestStatus*)error {
    MPLogEvent([MPLogEvent adShowFailedForAdapter:NSStringFromClass(self.class) error:error]);
    [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:(NSError *)error];
}

-(void)interstitialWillDismiss:(IMInterstitial*)interstitial {
    MPLogEvent([MPLogEvent adWillDisappearForAdapter:NSStringFromClass(self.class)]);
    [self.delegate interstitialCustomEventWillDisappear:self];
}

-(void)interstitialDidDismiss:(IMInterstitial*)interstitial {
    MPLogEvent([MPLogEvent adDidDisappearForAdapter:NSStringFromClass(self.class)]);
    [self.delegate interstitialCustomEventDidDisappear:self];
}

-(void)interstitial:(IMInterstitial*)interstitial didInteractWithParams:(NSDictionary*)params {
    MPLogEvent([MPLogEvent adTappedForAdapter:NSStringFromClass(self.class)]);
    [self.delegate interstitialCustomEventDidReceiveTapEvent:self];
}

-(void)interstitial:(IMInterstitial*)interstitial rewardActionCompletedWithRewards:(NSDictionary*)rewards {
    if(rewards!=nil){
        MPLogInfo(@"InMobi banner reward action completed with rewards: %@", [rewards description]);
    }
}

-(void)userWillLeaveApplicationFromInterstitial:(IMInterstitial*)interstitial {
    MPLogEvent([MPLogEvent adWillLeaveApplicationForAdapter:NSStringFromClass(self.class)]);
    [self.delegate interstitialCustomEventWillLeaveApplication:self];
}

@end
