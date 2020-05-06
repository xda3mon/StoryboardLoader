Pod::Spec.new do |s|

 s.name          = 'NibLoader'
 s.version       = '0.0.5'
 s.license       = 'MIT'
 s.summary       = 'A way to load a view/controller from Xib/UIStoryboard with Swift on iOS'
 s.homepage      = 'https://github.com/dumbass-cn/StoryboardLoader.git'
 s.author        = { 'Dumbass' => 'dumbass.cn@outlook.com' }
 s.source        = { :git => 'https://github.com/dumbass-cn/StoryboardLoader.git', :tag => s.version }
 s.platform      = :ios
 s.source_files  = 'Source/*.swift'
 s.framework     = 'UIKit'
 s.requires_arc  = true
 s.ios.deployment_target = '8.0'
 s.swift_version = '4.0'
 
end
