#
# Be sure to run `pod lib lint LuanchManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "LuanchManager"
  s.version          = "0.1.0"
  s.summary          = "This will execute an action after luanch complete."

  s.homepage         = "https://github.com/Musjoy/LuanchManager"
  s.license          = 'MIT'
  s.author           = { "Raymond" => "Ray.musjoy@gmail.com" }
  s.source           = { :git => "https://github.com/Musjoy/LuanchManager.git", :tag => "v-#{s.version}" }

  s.ios.deployment_target = '7.0'

  s.user_target_xcconfig = {
    'GCC_PREPROCESSOR_DEFINITIONS' => 'MODULE_LUANCH_MANAGER'
  }

  s.source_files = 'LuanchManager/Classes/**/*'

end
