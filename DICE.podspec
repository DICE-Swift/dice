Pod::Spec.new do |s|
  s.name             = 'DICE'
  s.version          = '0.1.0'
  s.summary          = 'Lightweight DI framework for Swift'

  s.description      = <<-DESC
A very alpha version of DICE - lightweight DI framework for Swift.
                       DESC

  s.homepage         = 'https://github.com/dice-swift/dice'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Author1' => 'Email1' }
  s.source           = { :git => 'https://github.com/DICE-Swift/DICE.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'DICE/Classes/**/*'

  s.swift_version = '4.2'
  
  # s.resource_bundles = {
  #   'DICE' => ['DICE/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
