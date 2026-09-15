{ pkgs, ... }:
{
  #* Fonts ######################
  # Adding Nerd Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}