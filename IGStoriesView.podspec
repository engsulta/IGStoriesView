
Pod::Spec.new do |spec|
  spec.name         = "IGStoriesView"
  spec.version      = "0.0.3"
  spec.summary      = "IGStoriesView is a timeline stories card view"
  spec.description  = <<-DESC
  This CocoaPods library helps you integrate timeline stories card with designable view way so you can change layout of border using Interface builder easily.
                   DESC
  spec.homepage     = "https://github.com/engsulta/IGStoriesView"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Ahmed sultan" => "en.ahmedsultan@gmail.com" }
  spec.ios.deployment_target = "12.0"
  spec.swift_version = "5.3"
  spec.source       = { :git => "https://github.com/engsulta/IGStoriesView.git", :tag => "#{spec.version}" }
  spec.source_files  = "IGStoriesView", "IGStoriesView/**/*.{h,m,swift}"
  spec.resources = 'IGStoriesView/**/*.{xib,storyboard,xcassets,lproj}'

end
