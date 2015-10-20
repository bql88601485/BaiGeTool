
Pod::Spec.new do |s|

  s.name         = "BaiGeTool"
  s.version      = "1.0.0"
  s.summary      = "A short description of BaiGeTool."

  s.description  = <<-DESC
                   DESC

  s.homepage     = "https://github.com/bql88601485/BaiGeTool/"

  s.license      = "MIT (example)"


  s.author             = { "白奇龙" => "18601135365@163.com" }
  s.source       = { :git => "git@github.com:bql88601485/BaiGeTool.git", :tag => "1.0.0" }

  s.source_files  = "BaiGeTool", "BaiGeTool/**/*.{h,m}"

  s.ios.deployment_target = "6.0"
  s.osx.deployment_target = "10.11"

  s.framework = "XCTest"
end
