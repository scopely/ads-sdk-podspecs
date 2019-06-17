#
# Be sure to run `pod lib lint Scopely-MoPub-InMobi-Adapter.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Scopely-MoPub-InMobi-Adapter'
  s.version          = '8.1.0'
  s.summary          = 'InMobi Adapter for mediating through MoPub.'
  s.description      = <<-DESC
  Supported ad formats: Interstitial, Rewarded Video.\n
  To download and integrate the InMobi SDK, please check this tutorial: https://support.inmobi.com/monetize/ \n\n
  For inquiries and support, please reach out to https://support.inmobi.com/mytickets. \n
                       DESC

  s.homepage         = 'https://github.com/scopely/ads-sdk-podspecs/tree/master/Scopely-MoPub-InMobi-Adapters/8.1.0'
  s.license          = { :type => 'MIT', :text => 'For inquiries and support, please reach out to https://support.inmobi.com/mytickets.' }
  s.author           = { 'carlos-scopely' => 'carloscastillo@scopely.com' }
  s.source           = { :http => 'https://ccastillo-dev.s3.amazonaws.com/Scopely-MoPub-InMobi-Adapter8.1.0.zip' }

  s.ios.deployment_target = '8.0'
  s.static_framework = true
  s.source_files = 'Scopely-MoPub-InMobi-Adapter/InMobi/Classes/*.{h,m}'
  s.ios.vendored_frameworks = 'Scopely-MoPub-InMobi-Adapter/InMobi/InMobiSDK.framework'

  s.dependency 'mopub-ios-sdk', '5.7.1'
end
