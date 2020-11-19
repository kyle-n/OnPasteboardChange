Pod::Spec.new do |spec|

  spec.name = 'OnPasteboardChange'
  spec.version = ENV['LIB_VERSION'] || '1.0.0'
  spec.summary = 'A SwiftUI View modifier that triggers a callback whenever the pasteboard changes.'

  spec.description = <<-DESC
      OnPasteboardChange is a SwiftUI View modifier that triggers a callback whenever the pasteboard changes.
      Works with AppKit and UIKit - perfect for cross-platform projects.
    DESC

  spec.homepage = 'https://github.com/kyle-n/OnPasteboardChange'
  spec.license = 'MIT'
  spec.author = { 'Kyle Nazario' => 'kylebnazario+opbc@gmail.com'}
  spec.source = { :git => 'https://github.com/kyle-n/OnPasteboardChange.git', :tag => "#{spec.version}" }

  spec.source_files  = 'Sources', 'Sources/**/*.{swift}'
  spec.swift_versions = '5.3.1'
  spec.platforms = { :ios => '14.0', :osx => '10.16' }

end