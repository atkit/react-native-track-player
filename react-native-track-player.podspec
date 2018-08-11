require "json"

json = File.read(File.join(__dir__, "package.json"))
package = JSON.parse(json).deep_symbolize_keys
 
Pod::Spec.new do |s|
  s.name = package[:name]
  s.version = package[:version]
  s.license = { type: package[:license] }
  s.homepage = "https://github.com/react-native-kit/react-native-track-player.git"
  s.authors = package[:author]
  s.summary = package[:description]
  s.source = { git: package[:repository][:url] }
  s.source_files = "ios/**/*.{h,m,swift}"
  s.platform = :ios, "9.0"
  s.dependency "React"
end