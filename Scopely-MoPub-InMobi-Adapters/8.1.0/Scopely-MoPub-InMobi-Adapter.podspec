Pod::Spec.new do |s|
  s.name             = 'Scopely-MoPub-InMobi-Adapter'
  s.version          = '8.1.0'
  s.summary          = 'InMobi Adapter for mediating through MoPub.'
  s.description      = <<-DESC
  Supported ad formats: Interstitial, Rewarded Video.\n
  To download and integrate the InMobi SDK, please check this tutorial: https://support.inmobi.com/monetize/ \n\n
  For inquiries and support, please reach out to https://support.inmobi.com/mytickets. \n
                       DESC

  s.homepage         = 'https://support.inmobi.com/monetize'
  s.license          = { :type => 'Commercial', :file => 'LICENSE' }
  s.author           = { 'carlos-scopely' => 'carloscastillo@scopely.com' }
  s.source           = { :http => 'https://ccastillo-dev.s3.amazonaws.com/InMobiMopubAdapter8.1.0.zip' }

  s.ios.deployment_target = '8.0'
  s.source_files = 'InMobiMopubAdapter8.1.0/InMobi/*.{h,m}'
  s.ios.vendored_frameworks = 'InMobiSDK.framework'
  s.static_framework = true
  s.xcconfig = {
    "FRAMEWORK_SEARCH_PATHS": "\"$(PODS_ROOT)/InMobi\" \"$(PODS_ROOT)/mopub-ios-sdk\""
  }
  s.dependency 'mopub-ios-sdk', '5.7.1'
end
