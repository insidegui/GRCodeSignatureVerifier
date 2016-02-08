#
#  GRCodeSignatureVerifier
#

Pod::Spec.new do |s|
  s.name         = "GRCodeSignatureVerifier"
  s.version      = "1.0.0"
  s.summary      = "GRCodeSignatureVerifier can be used to check if an app has been tampered with by verifying It's code signature."
  s.description  = <<-DESC
                    Simple code signature verification for OS X apps.

                    GRCodeSignatureVerifier can be used to check if an app has been tampered with by verifying It's code signature.

                    [See demo app to learn more](https://github.com/insidegui/GRCodeSignatureVerifierDemo).
                   DESC
  s.homepage     = "https://github.com/insidegui/GRCodeSignatureVerifier"
  s.license      = "BSD"
  s.author       = { "Guilherme Rambo" => "eu@guilhermerambo.me" }
  s.source       = { :git => "https://github.com/insidegui/GRCodeSignatureVerifier.git", :tag => "#{s.version}" }

  s.osx.deployment_target = "10.11"
  s.requires_arc = true
  
  s.source_files = "GRCodeSignatureVerifier/*.{h,m}"
end