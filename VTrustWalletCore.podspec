Pod::Spec.new do |s|
  s.name         = 'VTrustWalletCore'
  s.version      = '5.0.0'
  s.summary      = 'Trust Wallet core data structures and algorithms.'
  s.homepage     = 'https://github.com/grachyov/wallet-core'
  s.license      = 'MIT'
  s.authors      = { 'Alejandro Isaza' => 'al@isaza.ca' }
  s.module_name  = 'WalletCore'
  s.visionos.deployment_target = '1.0'
  s.swift_version = '5.1'
  s.source = {
    http: 'https://github.com/grachyov/wallet-core/releases/download/v5.0.0/TrustWalletCore-5.0.0.tar.xz'
  }
  s.default_subspec = 'Core'
  s.subspec 'Types' do |ss|
    ss.source_files = 
      'Sources/Types/*.swift',
      'Sources/Generated/Enums/*.swift',
      'Sources/Generated/Protobuf/*.swift'
    ss.dependency 'VSwiftProtobuf'
  end
  s.subspec 'Core' do |ss|
    ss.vendored_frameworks = '*.xcframework'
    ss.exclude_files = 'Sources/Generated/WalletCore.h'
    ss.source_files =
      'include/**/*.h',
      'Sources/*.{swift,h,m,cpp}',
      'Sources/Extensions/*.swift',
      'Sources/Generated/*.{swift,h}'
    ss.public_header_files =
      'include/**/*.h',
      'Sources/*.h'
    ss.libraries = 'c++'
    ss.dependency 'VTrustWalletCore/Types'
  end
end
