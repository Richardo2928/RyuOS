{ pkgs, ... }:
{
  #* Niri #######################
  # Enable Niri and Wayland support
  programs.niri.enable = true;
  
  # Destop portal XDG
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}