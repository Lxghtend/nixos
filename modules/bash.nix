{ pkgs, ... }:
{
  programs.bash = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)";
      home = "sudo -E nvim /etc/nixos/home.nix";
      config = "sudo -E nvim /etc/nixos/configuration.nix";
      nixd = "cd /etc/nixos";
      extract = "tar -xf";
      bright = "sudo ddcutil setvcp 10 40 --display 2";
      dark = "sudo ddcutil setvcp 10 10 --display 2";
      windows = "nix-shell -p efibootmgr --run 'sudo efibootmgr --bootnext 0003 && sudo reboot'";
      nerdfetch = "/etc/nixos/modules/nerdfetch";
    };
    bashrcExtra = ''
      /etc/nixos/modules/nerdfetch
    '';
  };
}
