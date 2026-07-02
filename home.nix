{ config, pkgs, ... }: {
  home.username = "ethan";
  home.homeDirectory = "/home/ethan";
  home.stateVersion = "26.05";

  imports = [
   #./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/bash.nix
    ./modules/wofi.nix
    ./modules/git.nix
    ./modules/nvim
  ];

  xdg.configFile = {
    "hypr/hyprland.lua".source = ./hypr/hyprland.lua;
    "pypr/config.toml".source = ./hypr/pyprland.toml;

    "waybar/config".source = ./waybar/config;
    "waybar/style.css".source = ./waybar/style.css;
    "waybar/scripts".source = ./waybar/scripts;
    "waybar/assets".source = ./waybar/assets;
    "waybar/themes".source = ./waybar/themes;

    "swaync/config.json".source = ./swaync/config.json;
    "swaync/style.css".source = ./swaync/style.css;
  };

 # programs.starship = {
 #   enable = true;
 #   enableBashIntegration = true;
 # };

  services.easyeffects.enable = true;

  home.packages = with pkgs; [
    #neovim
    cmake
    gcc
    gnumake
    hyprshot
    waybar
    kdePackages.dolphin
    awww
    discord
    ffmpeg
    playerctl
    mpv
    zed-editor
    obs-studio
    easyeffects
    fastfetch
    nerdfetch
    pyprland
    swaynotificationcenter
    htop
    pulsemixer
    xournalpp
    nerd-fonts.hurmit
    nerd-fonts.code-new-roman
    #steam
    pkgs.millennium-steam
    r2modman
  ];
}
