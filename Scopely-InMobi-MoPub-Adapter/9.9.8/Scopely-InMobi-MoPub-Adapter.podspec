#
# Be sure to run `pod lib lint Scopely-InMobi-MoPub-Adapter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Scopely-InMobi-MoPub-Adapter'
  s.version          = '9.9.8'
  s.summary          = 'InMobi Adapter for mediating through MoPub.'
  s.description      = <<-DESC
  Supported ad formats: Interstitial, Rewarded Video.\n
  To download and integrate the InMobi SDK, please check this tutorial: https://support.inmobi.com/monetize/ \n\n
  For inquiries and support, please reach out to https://support.inmobi.com/mytickets. \n
                       DESC

  s.homepage         = 'https://github.com/scopely/ads-sdk-podspecs'
  s.license          = { :type => 'Commercial', :file => 'Scopely-InMobi/LICENSE' }
  s.author           = { 'mario' => 'mario@scopely.com' }
  s.source           = { :git => 'https://github.com/scopely/ads-sdk-podspecs.git' }

  s.ios.deployment_target = '8.0'
  s.static_framework = true
  s.source_files = 'Scopely-InMobi/9.9.8/InMobiAdapter/*.{h,m}'
  s.dependency 'mopub-ios-sdk', '5.9.0'
  s.dependency 'InMobiSDK', '9.0.1'
end