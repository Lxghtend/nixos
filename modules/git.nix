{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Lxghtend";
    userEmail = "lxghtend@gmail.com";
    extraConfig = {
      credential.helper = "store";
    };
  };
}
