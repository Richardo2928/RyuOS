{ pkgs, palette, inputs, ... }:
{
  imports = [
    ./modules/niri
    ./modules/greetd.nix
  ];

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };
}
