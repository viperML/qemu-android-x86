{
  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    self,
    nixpkgs,
    flake-parts,
  }:
    flake-parts.lib.mkFlake {inherit self;} {
      systems = ["x86_64-linux"];
      perSystem = {
        pkgs,
        self',
        ...
      }: {
        packages.source-rpm = pkgs.fetchurl {
          url = "https://osdn.mirror.constant.com/android-x86/71931/android-x86-9.0-r2.x86_64.rpm";
          sha256 = "sha256-blTiXZReBQz2pq0qw+B3Wt0EsdWGmJ4pJ2SZyNEeYp8=";
        };
        packages.default = pkgs.callPackage ./package.nix {
          src = self;
          source-rpm = self'.packages.source-rpm;
        };
        devShells.default = pkgs.mkShell {
          inherit (self'.packages.default) name;
          inputsFrom = [self'.packages.default];
          packages = [
            pkgs.shellcheck
            pkgs.shfmt
          ];
          SOURCE_RPM = "${self'.packages.source-rpm}";
        };
      };
    };
}
