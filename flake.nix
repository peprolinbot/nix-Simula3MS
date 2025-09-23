{
  description = "Nix packaging for Simula3MS (MIPS simulator by the GAC at the UDC)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    # to work with older version of flakes
    lastModifiedDate = self.lastModifiedDate or self.lastModified or "19700101";

    # Generate a user-friendly version number.
    version = builtins.substring 0 8 lastModifiedDate;

    supportedSystems = [
      "x86_64-linux"
    ];

    forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

    nixpkgsFor = forAllSystems (system: import nixpkgs {inherit system;});
  in rec {
    packages = forAllSystems (
      system: let
        pkgs = nixpkgsFor.${system};
      in rec {
        Simula3MS = pkgs.callPackage ./default.nix {};
        default = Simula3MS;
      }
    );

    devShells = forAllSystems (system: let
      pkgs = nixpkgsFor.${system};
    in {
      default = pkgs.mkShell {
        buildInputs = [self.packages.${system}.Simula3MS];
      };
    });
  };
}
