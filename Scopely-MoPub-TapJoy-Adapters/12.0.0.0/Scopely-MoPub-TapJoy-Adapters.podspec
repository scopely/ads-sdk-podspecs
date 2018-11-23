#
# Be sure to run `pod lib lint MoPub-TapJoy-Adapters.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
s.name             = 'Scopely-MoPub-TapJoy-Adapters'
s.version          = '12.0.0.0'
s.summary          = 'TapJoy Adapters for mediating through MoPub.'
s.description      = <<-DESC
Supported ad formats: Interstitial, Rewarded Video.\n
To download and integrate the TapJoy SDK, please check this tutorial: https://dev.tapjoy.com/sdk-integration/ios/getting-started-guide-publishers-ios/ \n\n
For inquiries and support, please email https://dev.tapjoy.com/contact-support/. \n
DESC
s.homepage         = 'https://github.com/mopub/mopub-ios-mediation'
s.license          = { :type => 'New BSD', :file => 'LICENSE' }
s.author           = { 'MoPub' => 'support@mopub.com' }
s.source           = { :git => 'https://github.com/mopub/mopub-ios-mediation.git', :commit => 'a9b5d5f68daeefabded0ccf43c06c719620f8c47' }
s.ios.deployment_target = '8.0'
s.static_framework = true
s.source_files = 'Tapjoy/*.{h,m}'
s.dependency 'mopub-ios-sdk', '5.4'
s.dependency 'TapjoySDK', '12.0.0'
end
