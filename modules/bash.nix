{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)";
      home = "sudo nano /etc/nixos/home.nix";
      config = "sudo nano /etc/nixos/configuration.nix";
      nixd = "cd /etc/nixos";
      nerdfetch = "/etc/nixos/modules/nerdfetch";
      windows = "nix-shell -p efibootmgr --run 'sudo efibootmgr --bootnext 0007 && sudo reboot'";
    };
    bashrcExtra = ''
      /etc/nixos/modules/nerdfetch
    '';
  };
}
