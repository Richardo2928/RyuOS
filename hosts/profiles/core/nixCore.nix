{pkgs, ... }:
{
  imports = [
    ./modules/audio.nix
    ./modules/fonts.nix
  ];
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly"; #daily, weekly, monthly, or systemd format
    options = "--delete-older-than 30d";
  }
}
