#
# Be sure to run `pod lib lint Scopely-Amazon-SDK-Test.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Scopely-Amazon'
  s.version          = '3.0.1'
  s.summary          = 'Scopely-Amazon SDK for games.'
  s.description      = <<-DESC
  Amazon SDK for Ads for showing Banners on games. It contains also other types of ads
  DESC

  s.homepage     = 'https://github.com/scopely/ads-sdk-podspecs'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { 'Jose Pinero' => 'jose.pinero@scopely.com' }
  s.source       = { :git => 'https://github.com/scopely/ads-sdk-podspecs.git' }

  s.ios.deployment_target = '8.0'
  s.static_framework = true
  s.vendored_frameworks = 'SDK/DTBiOSSDK.framework'
end
