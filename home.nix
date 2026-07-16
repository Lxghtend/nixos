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

    "niri/config.kdl".source = ./niri/config.kdl;

    "waybar/hypr/config".source = ./waybar-hypr/config;
    "waybar/hypr/style.css".source = ./waybar-hypr/style.css;
    "waybar/hypr/scripts".source = ./waybar-hypr/scripts;
    "waybar/hypr/assets".source = ./waybar-hypr/assets;
    "waybar/hypr/themes".source = ./waybar-hypr/themes;

    "waybar/niri/config".source = ./waybar-niri/config;
    "waybar/niri/style.css".source = ./waybar-niri/style.css;
    "waybar/niri/scripts".source = ./waybar-niri/scripts;
    "waybar/niri/assets".source = ./waybar-niri/assets;
    "waybar/niri/themes".source = ./waybar-niri/themes;

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
