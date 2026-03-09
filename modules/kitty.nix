{ pkgs, ... }:
{
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
}
