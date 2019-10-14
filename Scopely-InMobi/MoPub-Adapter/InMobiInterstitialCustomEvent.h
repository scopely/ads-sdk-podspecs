//
//  InMobiInterstitialCustomEvent.h
//  InMobi
//
#if __has_include(<MoPub/MoPub.h>)
    #import <MoPub/MoPub.h>
#elif __has_include(<MoPubSDKFramework/MoPub.h>)
    #import <MoPubSDKFramework/MoPub.h>
#else
    #import "MPInterstitialCustomEvent.h"
#endif


#if __has_include(<InMobiSDK/IMSdk.h>)
    #import <InMobiSDK/IMInterstitial.h>
#else
    #import <ASIMUnifiedSDK/IMInterstitial.h>
#endif

@interface InMobiInterstitialCustomEvent : MPInterstitialCustomEvent <IMInterstitialDelegate>

@end
