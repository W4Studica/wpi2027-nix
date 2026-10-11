{
  buildBinTool,
  allwpilibSources,
  frc-nix-maintainers,
}:

buildBinTool {
  pname = "sysid";

  humanName = "SysId";

  artifactHashes = {
    linuxarm32 = "sha256-cM+TnZVA/CORhjr48D1BHbUDHOlLVMu4SYpmhpC5SDU=";
    linuxarm64 = "sha256-tAokNvuXiv6WWMe6espbpnqsIwN9tuQaX1MvRrHzd/s=";
    linuxx86-64 = "sha256-T/vdaVqy4enzufCujeY/uJWwmoY7FioAYXIcAapzkpI=";
    osxuniversal = "sha256-hv/3mlckGtQ0EszONDgAuyPKwpJOMagahe/kU+l0/HU=";
  };

  iconPng = "${allwpilibSources}/sysid/src/main/native/resources/sysid-512.png";

  meta = {
    description = "A tool for performing system identification on FRC robots";
    maintainers = with frc-nix-maintainers; [ taciturnaxolotl ];
  };
}
