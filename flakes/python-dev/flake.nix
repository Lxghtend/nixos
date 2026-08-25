{
  description = "py flake (uv)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.python312
            pkgs.uv
          ];

          shellHook = ''
            if [ ! -d .venv ]; then
              UV_PYTHON=${pkgs.python312}/bin/python3.12 UV_PYTHON_PREFERENCE=only-system uv venv
            fi
            source .venv/bin/activate
            unset UV_PYTHON
            uv sync
          '';
        };
      });
}
