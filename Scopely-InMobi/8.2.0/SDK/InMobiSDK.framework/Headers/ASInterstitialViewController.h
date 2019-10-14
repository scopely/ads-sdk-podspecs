//
//  ASViewController.h
//  AerServSDK
//
//  Copyright (c) 2014 AerServ, LLC. All rights reserved.
//
/*! @header
 * View controller used to display an ad
 */

#import <UIKit/UIKit.h>

@protocol ASInterstitialViewControllerDelegate;

/*!
 * @class ASInterstitialViewController
 *
 * The `ASInterstitialViewController` class provides a full-screen advertisement.
 */
@interface ASInterstitialViewController : UIViewController

/*! The delegate that receives controller state changes. */
@property (nonatomic, weak) id<ASInterstitialViewControllerDelegate> delegate;

/*! 
 * A flag that defines the environment that the adserver requests are sent to.
 * kASEnvProduction, kASEnvStaging are the recommended choices for this flag.
 *
 * Remember to set this to kASEnvProduction before production builds!!!
 */
@property (nonatomic, assign) ASEnvironmentType env __deprecated_msg("This functionality has been removed");

/*!
 * Internal variable used for measurement, has no affect on serving ads. *
 */
@property (nonatomic, assign) ASPlatformType platform __deprecated_msg("This functionality has been removed");

/*!
 * If set to NO the animation is disable for any interstitial ads. Default is YES.
 * This setting will only disable animation for ads shown through AerMarket.
 */
@property (nonatomic, assign) BOOL hasAnimation;

/*
 * When set to YES video ad playback will start muted. This has the default value of NO. This
 * setting currently will only affect AerWall (Video) ads. Ads may still come in as muted if set to YES,
 * this depends on the dashboard setting and the ad type that is returned.
 */
@property (nonatomic, assign) BOOL isMuted __deprecated_msg("This functionality has been removed");

/*!
 * If set to YES the ads are in preload mode and will attempt to preload when loadAd is called
 */
@property (nonatomic, assign) BOOL isPreload;

/*!
 * If set to YES the ads are outlined in red. Remember to set
 * to NO for production builds.
 */
@property (nonatomic, assign) BOOL showOutline;

/*!
 * If set to YES the requested ad will utilize header bidding to preload an ad when loadAd is called
 */
@property (nonatomic, assign) BOOL useHeaderBidding __deprecated_msg("This functionality has been removed");

/*!
 * An optional set of publisher keywords that is used for custom macros and custom reports. Please
 * refer to the AerServ SSUI for more detail.
 */
@property (nonatomic, strong) NSDictionary* pubKeys;

/*! Returns the placement Id */
@property (readonly, nonatomic, copy) NSString* placementID;

/*!
 * An optional variable to associate ad requests with a user id.
 */
@property (nonatomic, copy) NSString* userId;

/*!
 * An optional variable to pass in APS DTB Ad DTB Ad response(s) to be included in the open auction.
 * If there is only a single APS DTB Ad DTB Ad response to be added, a single item array should be set.
 * Each ad request must add in the pre-required APS DTB Ad DTB Ad response such it can be considered in
 * open auction.
 */
@property (nonatomic, strong) NSArray* dtbAdResponses;

/*!
 * Returns an interstitial ad for the given ID.
 *
 * This will create a new full screen view controller for the given placement ID. If this
 * is called again before the controller is destroyed then a cached object for that ID is
 * returned. The view controller is uncached when the controller is destroyed.
 *
 * There can only be one controller for an ID at a time
 *
 * @param placementID An ID that identifies the placement to show.
 */
+ (instancetype)viewControllerForPlacementID:(NSString*)placementID withDelegate:(id<ASInterstitialViewControllerDelegate>)delegate;

/*!
 * Starts the ad request by loading the ad from the server.
 *
 * The delegate should implement interstitialViewControllerAdLoadedSuccssfully to know if an ad has loaded
 * sucessfully. interstitialViewControllerAdFailedToLoad:withError will be called if there is an error while
 * loading the ad.
 */
- (void)loadAd;

/*!
 * Presents the ad's view controller on the parent view controller modally.
 *
 * If there is no ad to display the user will be presented with a spinner until the ad
 * loads.
 */
- (void)showFromViewController:(UIViewController*)parentViewController;

/*!
 * play, pause
 *
 * Controls for the media player.
 */
- (void)play __deprecated_msg("This functionality has been removed");
- (void)pause __deprecated_msg("This functionality has been removed");

/*!
 * cancel
 *
 * Cancels and cleans up any associated ad
 */
- (void)cancel;

@end



/*!
 * The protocol is implemented to watch for ASInterstitialViewController state chages.
 */
@protocol ASInterstitialViewControllerDelegate<NSObject>

@optional

/*!
 * Called when the ad has loaded successfuly without preload. 
 * 
 * @param viewController The view controller that the ad is displayed on.
 */
- (void)interstitialViewControllerAdLoadedSuccessfully:(ASInterstitialViewController*)viewController;

/*!
 * Called when the ad has preloaded and is ready to be shown.
 *
 * @param viewController - The view controller with an ad preloaded, needs to be implemented for preload case.
 */
- (void)interstitialViewControllerDidPreloadAd:(ASInterstitialViewController*)viewController;

/*!
 * Called when the ad failed has failed to load.
 *
 * @param viewController The view controller that attempted to load the ad.
 * @param error The error that caused the load to fail.
 */
- (void)interstitialViewControllerAdFailedToLoad:(ASInterstitialViewController*)viewController withError:(NSError*)error;

/*!
 * Called just before the view appears
 * 
 * @param viewController The view controller whose view is about to appear.
 */
- (void)interstitialViewControllerWillAppear:(ASInterstitialViewController*)viewController;

/*!
 * Called just after the view controller's view appears.
 *
 * @param viewController The view controller whose view appeared.
 */
- (void)interstitialViewControllerDidAppear:(ASInterstitialViewController*)viewController;

/*!
 * Called when the view controller sends an ad impression event.
 *
 * @param viewController The view controller whose view has registered an impression.
 */
- (void)interstitialViewControllerAdImpression:(ASInterstitialViewController*)viewController;

/*!
 * Called after an ad finishes playing.
 *
 * @param viewController The view controller whose video ad has finished playing completely.
 */
- (void)interstitialViewControllerAdDidComplete:(ASInterstitialViewController*)viewController;

/*!
 * Called just before the view is dismissed
 *
 * @param viewController The view controller whose view is about to be dismissed.
 */
- (void)interstitialViewControllerWillDisappear:(ASInterstitialViewController*)viewController;

/*!
 * Called just after the view is dismissed
 *
 * @param viewController The view controller whose view was dismissed.
 */
- (void)interstitialViewControllerDidDisappear:(ASInterstitialViewController*)viewController;

/*!
 * Called when an ad has been touched.
 *
 * @param viewController The view controller whose ad has received a touch/click.
 */
- (void)interstitialViewControllerAdWasTouched:(ASInterstitialViewController*)viewController;

/*!
 * Called when there has been an interaction with an ad.
 *
 * @param viewController The view controller whose ad has received an interaction.
 */
- (void)interstitialViewControllerAdInteraction:(ASInterstitialViewController*)viewController __deprecated_msg("This functionality has been removed, listen to -interstitialViewControllerAdWasTouched: instead");

/*!
 * Called when the ad takes the user outside of the application.
 *
 * @param viewController The view controller that is taking the user outside of the application.
 */
- (void)interstitialViewControllerWillLeaveApplication:(ASInterstitialViewController*)viewController;

/*!
 * This called when an ad with a virtual currency reward has loaded
 *
 * @param viewController - The view controller wtih an ad loaded that has virtual currency enabled.
 * @param vcData - A dictionary containing the virtual currency data; contains "name", "rewardAmount", "buyerName", and "buyerPrice" keys
 */
- (void)interstitialViewControllerDidVirtualCurrencyLoad:(ASInterstitialViewController*)viewController vcData:(NSDictionary*)vcData;

/*!
 * This called when an ad with a virtual currency reward has been rewarded
 *
 * @param viewController - The view controller with an ad that completed rewarding virtual currency
 * @param vcData - A dictionary containing the virtual currency data; contains "name" and "rewardAmount" keys
 */
- (void)interstitialViewControllerDidVirtualCurrencyReward:(ASInterstitialViewController*)viewController vcData:(NSDictionary*)vcData;

/*!
 * This is called when an ad is first loaded with a price.
 *
 * @param viewController - The view controller with an ad to show
 * @param transactionInfo - A dictionary containing transaction data; contains "buyerName" and "buyerPrice" keys
 */
- (void)interstitialViewController:(ASInterstitialViewController*)viewController didLoadAdWithTransactionInfo:(NSDictionary*)transactionInfo;

/*!
 * When an ad is successfully shown, this method is called to display the final price of the ad.
 *
 * @param viewController - The view controller with an ad to show
 * @param transactionInfo - A dictionary containing transaction data; contains "buyerName" and "buyerPrice" keys
 */
- (void)interstitialViewController:(ASInterstitialViewController*)viewController didShowAdWithTransactionInfo:(NSDictionary*)transactionInfo;

/*!
 * This is called when there's an advertiser event reported
 *
 * @param viewController - The view controller with an advertiser event reported
 * @param msg - The message associated with the advertiser event
 */
- (void)interstitialViewController:(ASInterstitialViewController*)viewController didFireAdvertiserEventWithMessage:(NSString*)msg __deprecated_msg("This funtionality has been removed");


@end
