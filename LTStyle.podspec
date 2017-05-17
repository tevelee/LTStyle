Pod::Spec.new do |s|
  s.version      = "0.1"
  s.name         = "LTStyle"
  s.summary      = "LTStyle"

  s.description  = <<-DESC
  LTStyle
                   DESC

  s.homepage     = "http://github.com/tevelee/LTStyle"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author             = { "László Teveli" => "tevelee@gmail.com" }
  
  s.ios.deployment_target = "5.0"
  s.osx.deployment_target = "10.7"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "http://github.com/tevelee/LTStyle.git", :tag => "#{s.version}" }

  s.source_files  = "Classes/**/*.{h,m}"
  s.public_header_files = "Classes/Public/**/*.h"
end
