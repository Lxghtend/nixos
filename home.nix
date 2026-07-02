{ config, pkgs, clip-organizer-pkg, ... }: {
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
    go
    # Desktop
    hyprshot
    pyprland
    pulsemixer
    htop
    waybar
    swaynotificationcenter
    kdePackages.dolphin
    awww
    # Misc
    clip-organizer-pkg
    playerctl
    ffmpeg
    mpv
    imv
    celluloid
    evtest
    # Apps
    discord
    xournalpp
    zed-editor
    obs-studio
    obs-cmd
    easyeffects
    fastfetch
    nerdfetch
    kdePackages.kdenlive
    # Fonts
    nerd-fonts.hurmit
    nerd-fonts.code-new-roman
    # Gaming
    #steam
    millennium-steam
    r2modman
    prismlauncher
    ryubing
    dolphin-emu 
  ];
}
