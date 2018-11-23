#
# Be sure to run `pod lib lint MoPub-Google-Adapters.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
s.name             = 'Scopely-MoPub-AdMob-Adapters'
s.version          = '7.31.0.2'
s.summary          = 'Google Adapters for mediating through MoPub.'
s.description      = <<-DESC
Supported ad formats: Banner, Interstitial, Rewarded Video, Native.\n
To download and integrate the Mobile Ads SDK, please check this tutorial: https://developers.google.com/admob/ios/download.\n\n
For inquiries and support, please utilize the developer support forum: https://groups.google.com/forum/#!forum/google-admob-ads-sdk/. \n
DESC
s.homepage         = 'https://github.com/mopub/mopub-ios-mediation'
s.license          = { :type => 'New BSD', :file => 'LICENSE' }
s.author           = { 'MoPub' => 'support@mopub.com' }
s.source           = { :git => 'https://github.com/mopub/mopub-ios-mediation.git', :commit => '379b5348a20330f65f4048f75b49c156f3e1813d' }
s.ios.deployment_target = '8.0'
s.static_framework = true
s.source_files = 'AdMob/*.{h,m}'
s.dependency 'mopub-ios-sdk', '5.3'
s.dependency 'Google-Mobile-Ads-SDK', '7.31.0'
end
