Pod::Spec.new do |s|

  s.name         = "DetectorKit"
  s.version      = "0.0.1"
  s.summary      = "Simple object detection, framing and obfuscation"
  s.description  = "Easily add object detection framing the obfuscation to images"
  s.homepage     = "http://www.github.com/stevewight/DetectorKit"
  s.license      = "MIT"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "Steve Wight" => "stevendouglaswight@gmail.com" }
  s.platform     = :ios, "10.0"
  s.source       = { :path => "" }
  s.source_files = "DetectorKit/**/*.{h,m,swift}"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end
