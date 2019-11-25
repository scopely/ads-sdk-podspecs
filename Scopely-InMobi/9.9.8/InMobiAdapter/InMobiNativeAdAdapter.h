//
//  InMobiNativeAdapter.h
//  InMobiMopubSampleApp
//
//  Created by Niranjan Agrawal on 28/10/15.
//
//
//
//#ifndef InMobiNativeAdapter_h
//#define InMobiNativeAdapter_h
//
//#endif /* InMobiNativeAdapter_h */

#import <Foundation/Foundation.h>

#if __has_include(<MoPub/MoPub.h>)
    #import <MoPub/MoPub.h>
#elif __has_include(<MoPubSDKFramework/MoPub.h>)
    #import <MoPubSDKFramework/MoPub.h>
#else
    #import "MPNativeAdAdapter.h"
#endif

#import <InMobiSDK/IMNative.h>

@interface InMobiNativeAdAdapter : NSObject <MPNativeAdAdapter,IMNativeDelegate>

@property (nonatomic, weak) id<MPNativeAdAdapterDelegate> delegate;
@property (nonatomic, strong) IMNative* nativeAd;
@property (nonatomic, strong) UIView* adView;

- (instancetype)initWithInMobiNativeAd:(IMNative *)nativeAd;

/*
 * Optional methods to tell the adapter where to find specific ad assets
 * within an InMobi native ad response.
 *
 * InMobi uses JSON objects to represent its native ads. In order to find
 * a specific ad asset within the JSON (such as the title or the URL for the
 * landing page), the native ad adapter needs to know the key (or name)
 * that maps to that asset. The typical InMobi JSON uses a set of default keys
 * as shown below; however, you are given the option to customize the keys
 * on the InMobi website. If you have customized these keys, you must use
 * the provided methods to inform the adapter of any mappings that have
 * changed. Otherwise, the adapter may be unable to locate the assets.
 *
 * If you have not customized these keys, you will not need to use these
 * methods, with one possible exception. Ads created on the InMobi website
 * before 6-25-2014 use the string "landing_url" as the key for the landing
 * page URL, while ads created after that date either use "landingURL" or a
 * customizable key. The adapter uses "landing_url" by default, but you should
 * look at your ad's JSON preview on the InMobi website to determine if your
 * landing page URL key is different. If it is, you must use
 * +setCustomKeyForLandingURL: to ensure that the adapter is able to locate
 * the URL.
 *
 * Default values:
 *      title           - "title"
 *      description     - "description"
 *      call to action  - "cta"
 *      primaryView     - primary ad View
 *      rating          - "rating"
 *      screenshot      - "screenshots"
 *      icon            - "icon"
 *      landing url     - "landing_url"
 */

+ (void)setCustomKeyForTitle:(NSString *)key;
+ (void)setCustomKeyForDescription:(NSString *)key;
+ (void)setCustomKeyForCallToAction:(NSString *)key;
+ (void)setCustomKeyForPrimaryAdView:(NSString *)key;
+ (void)setCustomKeyForRating:(NSString *)key;
+ (void)setCustomKeyForScreenshot:(NSString *)key;
+ (void)setCustomKeyForIcon:(NSString *)key;
+ (void)setCustomKeyForLandingURL:(NSString *)key;

@end
