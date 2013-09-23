Pod::Spec.new do |s|
  s.name     = 'DDProgressView'
  s.version  = '0.1'
  s.license  = 'BSD'
  s.summary  = 'A custom UIProgressView à la Twitter for iPhone.'
  s.homepage = 'https://github.com/ddeville/DDProgressView'
  s.author   = { 'Damien DeVille' => 'http://www.ddeville.me' }
  s.source   = { :git => 'https://github.com/nimast/DDProgressView.git', :commit => 'fa756ef8f03a46b5bddb0078a8eabcc0228a9862' }
  s.description = 'DDProgressView works on both iOS and Mac OS, and provides a round edged progress view.'
  s.ios.source_files =  'DDProgressView/DDProgressView.*'
  s.osx.source_files =  'DDProgressView/DDProgressView.*', 'DDProgressView/AppKitCompatibility.*'
end