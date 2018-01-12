
Pod::Spec.new do |s|

  s.name         = "SZPlaceholderTextView"
  s.version      = "0.0.3"
  s.summary      = "textView with placeholder"
  s.homepage     = "https://github.com/chenshengzhi/SZPlaceholderTextView"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "陈圣治" => "329012084@qq.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/chenshengzhi/SZPlaceholderTextView.git", :tag => s.version.to_s }
  s.source_files = "SZPlaceholderTextView/*.{h,m}"

end
