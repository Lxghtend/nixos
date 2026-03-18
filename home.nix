{ config, pkgs, ... }: {
  home.username = "ethan";
  home.homeDirectory = "/home/ethan";
  home.stateVersion = "25.11";

  imports = [
    ./modules/hyprland.nix
    ./modules/kitty.nix
    ./modules/bash.nix
    ./modules/wofi.nix
    ./modules/git.nix
    ./modules/nvim
  ];

  xdg.configFile = {
    "waybar/config".source = ./waybar/config;
    "waybar/style.css".source = ./waybar/style.css;
    "waybar/scripts".source = ./waybar/scripts;
    "waybar/assets".source = ./waybar/assets;
    "waybar/themes".source = ./waybar/themes;

    "swaync/config.json".source = ./swaync/config.json;
    "swaync/style.css".source = ./swaync/style.css;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };

  services.easyeffects.enable = true;

  home.packages = with pkgs; [
    # Coding
    #neovim
    cmake
    gcc
    gnumake
    # Desktop
    hyprshot
    waybar
    swaynotificationcenter
    kdePackages.dolphin
    swww
    # Apps
    discord
    obs-studio
    easyeffects
    fastfetch
    nerdfetch
    # Fonts
    nerd-fonts.hurmit
    nerd-fonts.code-new-roman
    # Gaming
    steam
    r2modman
  ];
}
