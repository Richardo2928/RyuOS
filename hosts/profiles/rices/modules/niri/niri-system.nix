#* Niri #######################
# hosts/rices/modules/niri/niri-system.nix
{ pkgs, ... }:
{
  # Enable Niri
  programs.niri.enable = true;
  
  # Destop portal XDG
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
}