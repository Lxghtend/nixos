{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)";
      home = "sudo nvim /etc/nixos/home.nix";
      config = "sudo nvim /etc/nixos/configuration.nix";
      nixd = "cd /etc/nixos";
      nerdfetch = "/etc/nixos/modules/nerdfetch";
      windows = "nix-shell -p efibootmgr --run 'sudo efibootmgr --bootnext 0007 && sudo reboot'";
    };
    bashrcExtra = ''
      /etc/nixos/modules/nerdfetch
    '';
  };
}
