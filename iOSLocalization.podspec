#
#  Be sure to run `pod spec lint iOS-Localization.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/]
#


Pod::Spec.new do |spec|

  spec.name         = "iOSLocalization"
  spec.version      = "0.0.4"
  spec.summary      = "this lib we can use for the Localization."

  spec.description  = <<-DESC
This CocoaPods library helps you perform calculation.
                   DESC

  spec.homepage     = "https://github.com/Raj-Sai/iOS-Localization.git"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "Amsaraj Mariyappan" => "raj.amsarajm93@gmail.com" }

  spec.ios.deployment_target = "12.1"
  spec.swift_version = "4.2"

  spec.source        = { :git => "https://github.com/Raj-Sai/iOS-Localization.git", :branch => "main", :tag => "0.0.4" }
  spec.source_files  = "iOS-Localization/**/*.{h,m,swift}"
	spec.dependency 'i18next'
end

