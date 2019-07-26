#
# Be sure to run `pod lib lint Scopely-Amazon-SDK.podspec.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Scopely-Amazon-SDK'
  s.version          = '3.0.0'
  s.summary          = 'Scopely-Amazon SDK for games.'
  s.description      = <<-DESC
  Amazon SDK for Ads for showing Banners on games. It contains also other types of ads
  DESC


  s.homepage     = 'https://github.com/scopely/ads-sdk-podspecs'
  s.license      = { :type => 'MIT', :file => 'Scopely-Amazon/LICENSE' }
  s.author       = { 'Jose Pinero' => 'jose.pinero@scopely.com' }
  s.source       = { :git => 'https://github.com/scopely/ads-sdk-podspecs.git', :tag => "Amazon-#{s.version}" }

  s.ios.deployment_target = '8.0'
  s.static_framework = true
  s.vendored_frameworks = 'Scopely-Amazon/SDK/DTBiOSSDK.framework'
end
