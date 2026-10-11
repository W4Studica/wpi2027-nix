{
  buildBinTool,
  allwpilibSources,
  frc-nix-maintainers,
}:

buildBinTool {
  pname = "datalogtool";

  humanName = "DataLogTool";

  artifactHashes = {
    linuxarm32 = "sha256-BZ6X1tC2ltvWW/ptbYifQIGpUlz6Jg9jVpv6CMyxJuQ=";
    linuxarm64 = "sha256-ecUvcMGE4rDn0wWFJMSDPk/IH2aOkOF8z7U9pivfDm0=";
    linuxx86-64 = "sha256-w65MHg0aBg+cMzkAnssvRKGG5RJRy2GIbVd+wSuwIYw=";
    osxuniversal = "sha256-pDL3eCVE8Ent07f618DTDe36wCwlaPI0MKlqc68sGPM=";
  };

  iconPng = "${allwpilibSources}/datalogtool/src/main/native/resources/dlt-512.png";

  meta = {
    description = "A tool for downloading logs from FRC robots";
    maintainers = with frc-nix-maintainers; [ taciturnaxolotl ];
  };
}
