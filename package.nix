{
  src,
  source-rpm,
  stdenv,
  rpm2targz,
  squashfsTools,
  qemu,
  gnum4,
}:
stdenv.mkDerivation {
  name = "qemu-android-x86";
  inherit src;

  nativeBuildInputs = [
    gnum4
    rpm2targz
    squashfsTools
  ];

  propagatedBuildInputs = [
    qemu
  ];

  postPatch = ''
    sed -i "s#/usr#$out#" qemu-android-x86
  '';

  makeFlags = [
    "SOURCE_RPM=${source-rpm}"
    "DESTDIR=${placeholder "out"}"
  ];
}
