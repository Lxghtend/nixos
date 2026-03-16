{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Lxghtend";
      user.email = "lxghtend@gmail.com";
      credential.helper = "store";
      safe.directory = "/etc/nixos"; 
   };
  };
}
