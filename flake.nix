{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    minesddm = {
      url = "github:Davi-S/sddm-theme-minesddm/development";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    millennium.url = "github:SteamClientHomebrew/Millennium?dir=packages/nix";
    clip-organizer.url = "github:Lxghtend/clip-organizer/golang-hyprland";
    clip-organizer-niri.url = "github:Lxghtend/clip-organizer/golang-niri";
    kopuz.url = "github:Kopuz-org/kopuz";
  };

  outputs = { nixpkgs, home-manager, minesddm, millennium, clip-organizer, clip-organizer-niri, kopuz, ... }:  
  let
    system = "x86_64-linux";
    clip-organizer-pkg = clip-organizer.packages.${system}.default;
    clip-organizer-niri-pkg = clip-organizer-niri.packages.${system}.default;
  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        minesddm.nixosModules.default
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit clip-organizer-pkg clip-organizer-niri-pkg; };
          home-manager.users.ethan = import ./home.nix;
          home-manager.users.root = {
            imports = [ ./modules/nvim ];
            home.stateVersion = "26.05";
          };
          nixpkgs.overlays = [ millennium.overlays.default ];
          
          nix.settings = {
            substituters        = [ "https://kopuz.cachix.org" ];
            trusted-public-keys = [ "kopuz.cachix.org-1:J2X3AnAYhKTJW5S3aCLoA1ckonQXVNZMQvhZA0YAufw=" ];
          };
          environment.systemPackages = [ kopuz.packages.${system}.default ];
        }
      ];
    };
  };
}
