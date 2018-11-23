#
# Be sure to run `pod lib lint MoPub-AdColony-Adapters.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
s.name             = 'Scopely-MoPub-UnityAds-Adapters'
s.version          = '2.3.0.0'
s.summary          = 'Unity Adapters for mediating through MoPub.'
s.description      = <<-DESC
Supported ad formats: Interstitial, Rewarded Video.\n
To download and integrate the Unity Ads SDK, please check this tutorial: https://github.com/Unity-Technologies/unity-ads-iOS/releases.\n\n
For inquiries and support, please email unityads-support@unity3d.com.\n
DESC
s.homepage         = 'https://github.com/mopub/mopub-ios-mediation'
s.license          = { :type => 'New BSD', :file => 'LICENSE' }
s.author           = { 'MoPub' => 'support@mopub.com' }
s.source           = { :git => 'https://github.com/mopub/mopub-ios-mediation.git', :commit => '7fd551762a4fc7ebb0a9c7e4398ab86c7734d5d0' }
s.ios.deployment_target = '8.0'
s.static_framework = true
s.source_files = 'UnityAds/*.{h,m}'
s.dependency 'mopub-ios-sdk', '5.3'
s.dependency 'UnityAds', '2.3.0'
end

