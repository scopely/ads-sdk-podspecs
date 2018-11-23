#
# Be sure to run `pod lib lint MoPub-Applovin-Adapters.podspec' to ensure this is a
# valid spec before submitting.
#

Pod::Spec.new do |s|
  s.name             = 'MoPub-Applovin-Adapters'
  s.version          = '5.1.2.1'
  s.summary          = 'Applovin Adapters for mediating through MoPub.'
  s.description      = <<-DESC
Supported ad formats: Banners, Interstitial, Rewarded Video and Native.\n
To download and integrate the Applovin SDK, please check this page: https://www.applovin.com/integration#iosMoPubIntegration. \n\n
For inquiries and support, please visit https://www.applovin.com/support \n
                       DESC
  s.homepage         = 'https://github.com/mopub/mopub-ios-mediation'
  s.license          = { :type => 'New BSD', :file => 'LICENSE' }
  s.author           = { 'MoPub' => 'support@mopub.com' }
  s.source           = { :git => 'https://github.com/mopub/mopub-ios-mediation.git', :tag => 'master' }
  s.ios.deployment_target = '8.0'
  s.static_framework = true
  s.source_files = 'Applovin/*.{h,m}'
  s.dependency 'mopub-ios-sdk', '~> 5.0'
  s.dependency 'AppLovinSDK', '5.1.2'
end
