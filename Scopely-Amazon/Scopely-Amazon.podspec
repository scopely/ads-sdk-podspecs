#
#  Be sure to run `pod spec lint Scopely-Amazon.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|
  spec.name         = "Scopely-Amazon-Proj"
  spec.version      = "3.0.0"
  spec.summary      = "Scopely-Amazon SDK for games."

  spec.description  = <<-DESC
                   DESC

  spec.homepage     = "https://github.com/scopely/ads-sdk-podspecs"
  spec.license      = "MIT"
  spec.author             = { "Jose Pinero" => "jose.pinero@scopely.com" }
  spec.source       = { :git => "https://github.com/scopely/ads-sdk-podspecs.git", :tag => "Amazon-#{spec.version}" }

  spec.ios.deployment_target = '8.0'
  spec.static_framework = true
  spec.source_files = 'Scopely-Amazon/Scopely-Amazon/*.{h,m}'
  spec.vendored_frameworks = 'Scopely-Amazon/SDK/DTBiOSSDK.framework'

end
