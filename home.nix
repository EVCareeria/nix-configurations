{ config, pkgs, unstable,  ... }:
{  
  # TODO please change the username & home directory to your own
  home.username = "tuuhoo";
  home.homeDirectory = "/home/tuuhoo";

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    usbutils # lsusb
    unstable.mattermost-desktop
    gns3-gui
    lolcat
  ];

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "";
    userEmail = "";
  };

  home.stateVersion = "23.11";

  # Let home Manager install and manage it
  programs.home-manager.enable = true;
}
