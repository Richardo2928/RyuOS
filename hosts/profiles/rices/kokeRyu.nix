{ pkgs, palette, inputs, ... }:
{
  imports = [
    ./modules/niri
    ./modules/greetd.nix
  ];
}
