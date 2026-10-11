{
  buildBinTool,
  allwpilibSources,
  frc-nix-maintainers,
}:

buildBinTool {
  pname = "glass";

  humanName = "Glass";

  artifactHashes = {
    linuxarm32 = "sha256-WtpIuwvEoMyu/AydsTv9j0ukh/HtaRG94yptHmGsOXE=";
    linuxarm64 = "sha256-4espiMp0PwicABoOQGyLCZcB33fEtWvLrn2MCQXpEK4=";
    linuxx86-64 = "sha256-ss9FtSyhJsKbRhYW7vhKTvWsZl3eUk/dFXbOhNpppvY=";
    osxuniversal = "sha256-LIcGT4iukKFhPJbe0HdhtS3dGdy59f5aNvReoVILsdY=";
  };

  iconPng = "${allwpilibSources}/glass/src/app/native/resources/glass-512.png";

  meta = {
    description = "A dashboard and data visualization tool for FRC robots";
    maintainers = with frc-nix-maintainers; [ taciturnaxolotl ];
  };
}
