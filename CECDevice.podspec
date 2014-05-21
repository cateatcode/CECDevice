#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = "CECDevice"
  s.version          = "0.1.0"
  s.summary          = "Common UIDevice utilities"
  s.description      = <<-DESC
                       Include functions:
                        1.iOS version:get\compare
                        2.device type:iPad\iPhone\Simulator
                        3.is retina
                        4.is Camera avaliable
                       DESC
  s.homepage         = "https://github.com/cateatcode/CECDevice"
  s.license          = 'MIT'
  s.author           = { "qiang.xu" => "antwork@126.com" }
  s.source           = { :git => "http://EXAMPLE/NAME.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/EXAMPLE'

  # s.platform     = :ios, '5.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resources = 'Assets/*.png'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  # s.dependency 'JSONKit', '~> 1.4'
end
