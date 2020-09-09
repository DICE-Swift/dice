Pod::Spec.new do |s|
  s.name             = 'DICE'
  s.version          = '0.1.0'
  s.summary          = 'Lightweight DI framework for Swift and SwiftUI'

  s.description      = "DICE is a lightweight Swift framework that provides management system for dependency injection for Swift and SwiftUI."

  s.homepage         = 'https://github.com/dice-swift/dice'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alexander Tereshkov' => 'alexander@tereshkov.pw' }
  s.source           = { :git => 'https://github.com/DICE-Swift/DICE.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.osx.deployment_target     = '10.10'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target    = '9.0'

  s.source_files = 'DICE/Classes/**/*'

  s.swift_version = '5.0'
end
