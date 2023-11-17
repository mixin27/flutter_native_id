#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint native_id.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'native_id'
  s.version          = '0.0.5'
  s.summary          = 'Flutter Native ID'
  s.description      = <<-DESC
Get current device Android ID and UUID from within the flutter application.
                       DESC
  s.homepage         = 'https://github.com/mixin27/flutter_native_id'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'mixin27' => 'kyawzayartun.dev@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '11.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
