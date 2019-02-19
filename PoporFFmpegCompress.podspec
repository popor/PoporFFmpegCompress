#
# Be sure to run `pod lib lint PoporFFmpegCompress.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'PoporFFmpegCompress'
  s.version          = '0.0.01'
  s.summary          = '简化FFmpeg使用'
  
  s.homepage         = 'https://github.com/popor/PoporFFmpegCompress'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'popor' => '908891024@qq.com' }
  s.source           = { :git => 'https://github.com/popor/PoporFFmpegCompress.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'PoporFFmpegCompress/Classes/*.{h,m}'
  
  s.dependency 'PoporFFmpeg'
  
  
end
