{
  buildBinTool,
  allwpilibSources,
  gfortran,
  frc-nix-maintainers,
}:

buildBinTool {
  pname = "wpical";

  humanName = "wpical";

  artifactHashes = {
    linuxarm32 = "sha256-fqFkLzcbEPn00Q19SXtcGQaOZ3vyfmnOPQI5Wv0+68s=";
    linuxarm64 = "sha256-BIRzIHkfYPl968aeScQs4iHOi4MK10gSxSDGfP3aDEs=";
    linuxx86-64 = "sha256-mYDzIcomnWZZs/hioklE3FmGZmCdVHMpu7mYm0FU/EI=";
    osxuniversal = "sha256-kZZC28J26sUjeeIBog/sXPTSGHMcCyeU2MM59prBvFs=";
  };

  extraLibs = [ gfortran.cc ];

  iconPng = "${allwpilibSources}/wpical/src/main/native/resources/wpical-512.png";

  meta = {
    description = "Field Calibration Tool";
    maintainers = with frc-nix-maintainers; [ taciturnaxolotl ];
  };
}
