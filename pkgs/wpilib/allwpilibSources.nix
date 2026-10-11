{
  fetchFromGitHub,
}:
fetchFromGitHub rec {
  passthru = {
    branch = "release-2027";
    version = "2027.0.0-alpha-3";
    native.version = "2027.0.0-alpha-3";
  };

  owner = "wpilibsuite";
  repo = "allwpilib";
  rev = "v${passthru.version}";
  hash = "sha256-qSuAv/nfpUnoBDEUAOGNR6rbNSFesRuYZSiC4Pa8Hgs=";
}
