{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)";
      home = "sudo -E nvim /etc/nixos/home.nix";
      config = "sudo -E nvim /etc/nixos/configuration.nix";
      nixd = "cd /etc/nixos";
      svim = "sudo -E nvim";
      extract = "tar -xf";
      nerdfetch = "/etc/nixos/modules/nerdfetch";
    };
    bashrcExtra = ''
      /etc/nixos/modules/nerdfetch
    '';
  };
}
