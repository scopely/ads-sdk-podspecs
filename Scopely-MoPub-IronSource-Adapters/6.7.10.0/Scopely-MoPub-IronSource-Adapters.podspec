#
# Be sure to run `pod lib lint MoPub-IronSource-Adapters.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
s.name             = 'Scopely-MoPub-IronSource-Adapters'
s.version          = '6.7.10.0'
s.summary          = 'IronSource Adapters for mediating through MoPub.'
s.description      = <<-DESC
Supported ad formats: Interstitial, Rewarded Video.\n
To download and integrate the IronSource SDK, please check this tutorial: https://developers.ironsrc.com/ironsource-mobile/ios/ios-sdk/ \n\n
For inquiries and support, please check https://developers.ironsrc.com/submit-a-request/\n
DESC
s.homepage         = 'https://github.com/mopub/mopub-ios-mediation'
s.license          = { :type => 'New BSD', :file => 'LICENSE' }
s.author           = { 'MoPub' => 'support@mopub.com' }
s.source           = { :git => 'https://github.com/mopub/mopub-ios-mediation.git', :commit => 'f1208c7b0812aedb89774140cae3eee869d3c99a' }
s.ios.deployment_target = '8.0'
s.static_framework = true
s.source_files = 'IronSource/*.{h,m}'
s.dependency 'mopub-ios-sdk', '5.3'
s.dependency 'IronSourceSDK','6.7.10'
end

