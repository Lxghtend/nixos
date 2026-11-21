{ pkgs, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        minimal-lines = true;   # Shrinks height to fit the 3 options
        lines = 10;             # Max lines if you ever pass more options
        width = 22;             # Tighter horizontal width (in characters)
        horizontal-pad = 20;    # Default is 40
        vertical-pad = 12;      # Default is 8
      };
      colors = {
        # RRGGBBAA format: 'cc' gives ~80% opacity (semi-transparent)
        background = "fdf6e3cc"; 
      };
    };
  };
}
