{pkgs, ... }:
{
  imports = [
    ./modules/audio.nix
    ./modules/fonts.nix
  ];
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];
}
