{ pkgs, ... }:
{
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
    style = ''
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
  };
}
