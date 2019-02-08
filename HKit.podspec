Pod::Spec.new do |s|

  s.name            = 'HKit'
  s.version         = '0.0.2'
  s.summary         = 'A library of useful enums, extensions, protocols, and classes.'
  s.swift_version   = '4.2'

  s.homepage        = 'https://github.com/HimanshuParashar/HKit'
  s.license         = 'MIT'

  s.author          = { 'Himanshu Parashar' => 'hparashar07@gmail.com' }
  s.social_media_url   = "http://twitter.com/hparashar07"

  s.ios.deployment_target = '10.0'

  s.source          = { :git => 'https://github.com/HimanshuParashar/HKit.git', :tag => s.version.to_s }


  s.source_files  = 'HKit/Source/**/*'

end
