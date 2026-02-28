{ config, pkgs, ... }: {
  home.username = "ethan";
  home.homeDirectory = "/home/ethan";
  home.stateVersion = "25.11";

  programs.bash.enable = true;
  programs.bash.shellAliases = {
    rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#$(hostname)";
    home = "sudo nano /etc/nixos/home.nix";
    config = "sudo nano /etc/nixos/configuration.nix";
  };

  home.packages = with pkgs; [
    hyprshot
    kdePackages.dolphin
    swww
    discord
    fastfetch
    nerdfetch
    swaynotificationcenter
    nerd-fonts.hurmit
    nerd-fonts.code-new-roman
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

  programs.kitty = {
    enable = true;
    font = {
      name = "Hurmit Nerd Font";
      size = 11;
    };
    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      window_padding_width = 5;
      tab_bar_style = "slant";
      enable_audio_bell = false;
      notify_on_cmd_finish = "unfocused";

      foreground = "#c3c7c8";
      background = "#0f2024";
      background_opacity = "1.0";
      cursor = "#c3c7c8";
      active_tab_foreground = "#0f2024";
      active_tab_background = "#c3c7c8";
      inactive_tab_foreground = "#c3c7c8";
      inactive_tab_background = "#0f2024";
      active_border_color = "#c3c7c8";
      inactive_border_color = "#0f2024";
      bell_border_color = "#85523a";

      color0 = "#0f2024";
      color1 = "#85523a";
      color2 = "#23625a";
      color3 = "#48675b";
      color4 = "#7f6f56";
      color5 = "#bb6b33";
      color6 = "#5F9CA3";
      color7 = "#929a9c";
      color8 = "#5e7074";
      color9 = "#B26E4E";
      color10 = "#2F8379";
      color11 = "#608A7A";
      color12 = "#AA9473";
      color13 = "#FA8F44";
      color14 = "#7FBCC4";
      color15 = "#c3c7c8";
    };
  };

  programs.wofi = {
    enable = true;
    settings = {
      allow_images = true;
      width = 500;
      show = "drun";
      prompt = "Search";
      height = 400;
      term = "kitty";
      hide_scroll = true;
      print_command = true;
      insensitive = true;
      columns = 1;
      no_actions = true;
    };
  };
  
  programs.wofi.style = ''
    @define-color mauve #B26E4E;
    @define-color red #B26E4E;
    @define-color lavender #c3c7c8;
    @define-color text #c3c7c8;
    @define-color background #0f2024;

    * {
        all:unset;
        font-family: 'CodeNewRoman Nerd Font Mono', monospace;
        font-size: 18px;
        outline: none;
        border: none;
        text-shadow:none;
        background-color:transparent;
    }
    window {
        all:unset;
        padding: 20px;
        border-radius: 0px;
        background-color: alpha(@background,.5);
    }
    #inner-box {
        margin: 2px;
        padding: 5px;
        border: none;
    }
    #outer-box {
        border: none;
    }
    #scroll {
        margin: 0px;
        padding: 30px;
        border: none;
    }
    #input {
        all:unset;
        margin-left:20px;
        margin-right:20px;
        margin-top:20px;
        padding: 20px;
        border: none;
        outline: none;
        color: @text;
        box-shadow: 1px 1px 5px rgba(0,0,0, .5);
        border-radius:10px;
        background-color: alpha(@background,.2);
    }
    #input image {
        border: none;
        color: @red;
        padding-right:10px;
    }
    #input * {
        border: none;
        outline: none;
    }
    #input:focus {
        outline: none;
        border: none;
        border-radius:10px;
    }
    #text {
        margin: 5px;
        border: none;
        color: @text;
        outline: none;
    }
    #entry {
        border: none;
        margin: 5px;
        padding: 10px;
    }
    #entry arrow {
        border: none;
        color: @lavender;
    }
    #entry:selected {
        box-shadow: 1px 1px 5px rgba(255,255,255, .03);
        border: none;
        border-radius: 20px;
        background-color:transparent;
    }
    #entry:selected #text {
        color: @mauve;
    }
    #entry:drop(active) {
        background-color: @lavender !important;
    }
  '';

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      monitor = [
        "DP-3, 1920x1080@144.00, 0x0, 1"
        "HDMI-A-1, 1920x1080@74.97Hz, -1920x-60, 1"
      ];

      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$browser" = "firefox";
      "$discord" = "discord";
      "$menu" = "wofi -n";
      "$mainMod" = "SUPER";

      exec-once = [
        "waybar"
        "swww-daemon"
        "sleep .5 && swww restore"
        "swaync"
        "pypr"
        "swaync-client -df"
        "pactl set-sink-mute @DEFAULT_SINK@ 0"
      ];

      env = [
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "XCURSOR_SIZE,12"
      ];

      general = {
        gaps_in = 2;
        gaps_out = 10;
        border_size = 0;
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 0.78;
        inactive_opacity = 0.7;
        fullscreen_opacity = 1;
        blur = {
          enabled = true;
          size = 3;
          passes = 5;
          new_optimizations = true;
          ignore_opacity = true;
          xray = false;
          popups = true;
        };
        shadow = {
          enabled = true;
          range = 15;
          render_power = 5;
          color = "rgba(0,0,0,.5)";
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "fluid, 0.15, 0.85, 0.25, 1"
          "snappy, 0.3, 1, 0.4, 1"
        ];
        animation = [
          "windows, 1, 3, fluid, popin 5%"
          "windowsOut, 1, 2.5, snappy"
          "fade, 1, 4, snappy"
          "workspaces, 1, 1.7, snappy, slide"
          "specialWorkspace, 1, 4, fluid, slidefadevert -35%"
          "layers, 1, 2, snappy, popin 70%"
        ];
      };

      dwindle = {
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = -1;
        disable_hyprland_logo = true;
        focus_on_activate = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      device = {
        name = "epic-mouse-v1";
        sensitivity = 0;
      };

      layerrule = [
        "noanim, selection"
      ];

      bind = [
        "$mainMod, Q, exec, $terminal"
        "$mainMod, W, killactive"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, B, exec, $browser"
        "$mainMod, D, exec, $discord"
        "$mainMod, V, togglefloating"
        "$mainMod, R, exec, $menu"
        "$mainMod, P, pseudo"
        "$mainMod, J, togglesplit"
        "$mainMod, F, fullscreen"
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, Z, workspace, e-1"
        "$mainMod SHIFT, X, workspace, e+1"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        "$mainMod SHIFT CTRL, Z, movetoworkspace, e-1"
        "$mainMod SHIFT CTRL, X, movetoworkspace, e+1"
        "ALT, left, movewindow, l"
        "ALT, right, movewindow, r"
        "ALT, up, movewindow, u"
        "ALT, down, movewindow, d"
        "$mainMod SHIFT, S, exec, hyprshot -m region -o ~/Pictures/Screenshots/"
        "$mainMod, M, exit"
        "$mainMod, SPACE, exec, pypr toggle term"
        "$mainMod, G, exec, pypr toggle music"
        "$mainMod, T, exec, pypr toggle taskbar"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
