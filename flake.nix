{
  description = "Custom C++ development environment to build QT apps";

  # Flake outputs
  outputs = { self, nixpkgs }:
    let
      # Systems supported
      allSystems = [
        "x86_64-linux" # 64-bit Intel/AMD Linux
        "aarch64-linux" # 64-bit ARM Linux
        "x86_64-darwin" # 64-bit Intel macOS
        "aarch64-darwin" # 64-bit ARM macOS
      ];

      # Helper
      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });

    in
    {
      # Development environment output
      devShells = forAllSystems ({ pkgs }: {

        default = pkgs.mkShell {
          packages = with pkgs; [
            zig
            sqlite
          ];
        };
      });

      # Build the binary
      # packages = forAllSystems ({ pkgs }: {
      #   default = pkgs.stdenv.mkDerivation {
      #     name = "zig-test-project";
      #     src = "${self}/..";
      #
      #     # nativeBuildInputs = with pkgs; [ cmake ];
      #     buildInputs = with pkgs; [ zig ];
      #
      #     buildPhase = "ls -alF ; zig build";
      #     installPhase = "mv zig-out/bin $out";
      #   };
      # });
    };
}
