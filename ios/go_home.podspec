#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint go_home.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'go_home'
  s.version          = '1.0.0'
  s.summary          = 'Programatically riggering a "go to homescreen" action on Android and iOS'
  s.description      = <<-DESC
Programatically riggering a "go to homescreen" action on Android and iOS
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
