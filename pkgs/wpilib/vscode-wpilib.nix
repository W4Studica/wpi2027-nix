{
  vscode-utils,
  allwpilibSources,
  fetchurl,
  unzip,
  lib,
  frc-nix-maintainers,
}:
vscode-utils.buildVscodeExtension rec {
  version = "2027.0.0-alpha-7";

  pname = "${vscodeExtPublisher}-${vscodeExtName}";
  name = "${vscodeExtPublisher}-${vscodeExtName}-${version}";

  src = fetchurl {
    url = "https://github.com/wpilibsuite/vscode-wpilib/releases/download/v${version}/vscode-wpilib-${version}.vsix";
    hash = "sha256-yVz7kAgIVBET2Iadb9tGP4vE7prsAac9+u7CjVlqbIc=";
    # TODO: Once the version of nixpkgs in this flake is updated we should remove
    # the custom `name` and the `unzip` nativeBuildInput
    # See: https://github.com/NixOS/nixpkgs/commit/e24a734076ea21365bb618d63f5c9a70006dd196

    # For compatibility older versions of nixpkgs
    # The `*.vsix` file is in the end a simple zip file. Change the extension
    # so that existing `unzip` hooks takes care of the unpacking.
    name = "${name}.zip";
  };

  nativeBuildInputs = [ unzip ];

  # The extension builds a new project by copying template files out of its own folder, which is in
  # the Nix store: every file there is read-only, and `fs.cp`/`fs.copyFile` keep that mode. The next
  # steps (writing the GradleRIO version into build.gradle, copying gradle/wrapper into the project)
  # then fail and leave a half-made project without gradle-wrapper.jar. Make everything the extension
  # copies writable.
  postInstall = ''
    js="$(echo "$out"/share/vscode/extensions/*/out/extension.js)"
    {
      cat <<'EOF'
    const __fsp = require("fs/promises"), __cp = __fsp.cp, __copyFile = __fsp.copyFile;
    const __writable = (dest) => { try { require("child_process").execFileSync("chmod", ["-R", "u+w", String(dest)]); } catch (e) {} };
    __fsp.cp = async function (src, dest, opts) { const r = await __cp.call(this, src, dest, opts); __writable(dest); return r; };
    __fsp.copyFile = async function (src, dest, mode) { const r = await __copyFile.call(this, src, dest, mode); __writable(dest); return r; };
    EOF
      cat "$js"
    } > "$js.new"
    mv "$js.new" "$js"
  '';

  # VSCode Metadata
  vscodeExtPublisher = "wpilibsuite";
  vscodeExtName = "vscode-wpilib";
  vscodeExtUniqueId = "${vscodeExtPublisher}.${vscodeExtName}";

  # Package metadata
  meta = with lib; {
    description = "Visual Studio Code WPILib extension";
    homepage = "https://github.com/wpilibsuite/vscode-wpilib";
    license = licenses.bsd3;
    maintainers = with frc-nix-maintainers; [ taciturnaxolotl ];
    platforms = [
      "x86_64-linux"
      "x86_64-darwin"
      "aarch64-darwin"
      "aarch64-linux"
      "armv7l-linux"
    ];
  };
}
