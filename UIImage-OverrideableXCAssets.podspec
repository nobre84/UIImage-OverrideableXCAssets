Pod::Spec.new do |s|

  s.name         = "UIImage-OverrideableXCAssets"
  s.version      = "0.1"
  s.summary      = "UIImage category to allow loading different assets from multiple targets by adding a prefix."

  s.description  = <<-DESC
                   Problem: Multiple target scenario that should load different assets from a xcassets file. This simple UIImage category checks the existance of an overridden asset name with a configurable prefix and loads it instead using by swizzling UIImage's imagedNamed: and imageNamed:inBundle:compatibleWithTraitCollection:                   
                   DESC

  s.homepage     = "https://github.com/nobre84/UIImage-OverrideableXCAssets"

  s.license      = "MIT"  

  s.author             = { "Rafael Nobre" => "nobre84@gmail.com" }
  
  s.platform     = :ios

  s.source       = { :git => "https://github.com/nobre84/UIImage-OverrideableXCAssets.git", :tag => s.version.to_s }

  s.source_files  = "Library", "Library/*.{h,m}"

  s.dependency 'JRSwizzle', '~> 1.0'

  s.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-lObjC' }

end
