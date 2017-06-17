
Pod::Spec.new do |s|

 s.name          = 'StoryboardLoader'
 s.version       = '0.0.1'
 s.license       = 'MIT'
 s.summary       = 'A way to load a view controller from UIStoryboard with Swift for iOS'
 s.homepage      = 'https://github.com/287258813/StoryboardLoader'
 s.author        = { 'Dumbass' => 'missyouguys@outlook.com' }
 s.source        = { :git => 'https://github.com/287258813/StoryboardLoader.git', :tag => s.version }
 s.platform      = :ios
 s.source_files  = 'Source/*.swift'
 s.framework     = 'UIKit'
 s.requires_arc  = true
 s.ios.deployment_target = '10.0'
end
~                                                                                                                                                                                 
~                        
