//
//  MAAd.h
//  AppLovinSDK
//
//  Created by Thomas So on 8/10/18.
//  Copyright © 2020 AppLovin Corporation. All rights reserved.
//

#import "MAAdFormat.h"

NS_ASSUME_NONNULL_BEGIN

/**
 * This class represents an ad that has been served by AppLovin's mediation server and should be displayed to the user.
 */
@interface MAAd : NSObject

/**
 * Get format of this ad.
 */
@property (nonatomic, strong, readonly) MAAdFormat *format;

/**
 * The ad unit id for which this ad was loaded.
 */
@property (nonatomic, copy, readonly) NSString *adUnitIdentifier;

/**
 * The ad network for which this ad was loaded from.
 */
@property (nonatomic, copy, readonly) NSString *networkName;

/**
 * The creative id tied to the ad, if any. It may not be available for some ad networks until @code -[MAFullscreenAdDelegate didDisplayAd:] @endcode is called.
 */
@property (nonatomic, copy, readonly, nullable) NSString *creativeIdentifier;

/**
 * @return The placement to tie the ad's postbacks to.
 */
@property (atomic, copy, readonly, nullable) NSString *placement;

+ (instancetype)new NS_UNAVAILABLE;

@end

NS_ASSUME_NONNULL_END
