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

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  Supported ad formats: Interstitial, Rewarded Video.\n
  To download and integrate the InMobi SDK, please check this tutorial: https://support.inmobi.com/monetize/ \n\n
  For inquiries and support, please reach out to https://support.inmobi.com/mytickets. \n
                       DESC

  s.homepage         = 'https://github.com/carlos-scopely/Scopely-MoPub-InMobi-Adapter'
  s.license          = { :type => 'Commercial', :file => 'LICENSE' }
  s.author           = { 'carlos-scopely' => 'carloscastillo@scopely.com' }
  s.source           = { :http => 'https://ccastillo-dev.s3.amazonaws.com/InMobiMopubAdapter8.1.0.zip' }

  s.ios.deployment_target = '8.0'
  s.source_files = 'InMobiMopubAdapter8.1.0/InMobi/*.{h,m}'
  s.static_framework = true
  s.xcconfig = {
    "FRAMEWORK_SEARCH_PATHS": "\"$(PODS_ROOT)/InMobi\" \"$(PODS_ROOT)/mopub-ios-sdk\""
  }
  s.dependency 'mopub-ios-sdk', '5.7.1'
end
