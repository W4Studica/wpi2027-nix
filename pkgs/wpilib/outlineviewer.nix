{
  buildBinTool,
  allwpilibSources,
  frc-nix-maintainers,
}:

buildBinTool {
  pname = "outlineviewer";

  humanName = "OutlineViewer";

  artifactHashes = {
    linuxarm32 = "sha256-SBV9yA9FI1xPEnZbJ4KmQWHhB03M4PjZ6mPsZ9y5xUs=";
    linuxarm64 = "sha256-hc3mXrBx7uRKETMCoVUSWs+mQrpxazaCQTvvCWJp7F8=";
    linuxx86-64 = "sha256-Vtv+KzgOyJR2V99GIva6V3kO7PQyr0+nyR+dGdzDPfw=";
    osxuniversal = "sha256-6OA39K4pd4DfT5ANFn8o33oNX7pcNeVU0j/2MSyI7RE=";
  };

  iconPng = "${allwpilibSources}/outlineviewer/src/main/native/resources/ov-512.png";

  meta = {
    description = "A utility used to view, modify and add to the contents of NetworkTables";
    maintainers = with frc-nix-maintainers; [ taciturnaxolotl ];
  };
}
