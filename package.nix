{
  src,
  source-rpm,
  stdenv,
  rpm2targz,
  squashfsTools,
  qemu,
  gnum4,
  e2fsprogs,
  lib,
  makeWrapper,
}:
stdenv.mkDerivation rec {
  name = "qemu-android-x86";
  inherit src;

  nativeBuildInputs = [
    gnum4
    rpm2targz
    squashfsTools
    makeWrapper
  ];

  propagatedBuildInputs = [
    qemu
    e2fsprogs
  ];

  postFixup = ''
    wrapProgram $out/bin/* \
      --prefix PATH ':' ${lib.makeBinPath propagatedBuildInputs}
  '';

  makeFlags = [
    "SOURCE_RPM=${source-rpm}"
    "DESTDIR=${placeholder "out"}"
    "PREFIX="
  ];
}
