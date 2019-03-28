#
# Be sure to run `pod lib lint Particles.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Particles'
  s.version          = '0.2.0'
  s.summary          = 'A native swift framework for creating particles.'

  s.homepage         = 'https://github.com/Ryucoin/Particles'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'WyattMufson' => 'wyatt@ryucoin.com' }
  s.source           = { :git => 'https://github.com/Ryucoin/Particles.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.swift_version = '4.2'

  s.source_files = 'Particles/Classes/**/*'

end
