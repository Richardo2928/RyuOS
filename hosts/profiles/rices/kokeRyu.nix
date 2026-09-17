{ pkgs, palette, inputs, ... }:
{
  imports = [
    ./modules/niri
    ./modules/audio.nix
    ./modules/fonts.nix
    ./modules/greetd.nix
  ];
}
