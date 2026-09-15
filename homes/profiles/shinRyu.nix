{ pkgs, ... }:
{
  imports = [
    ../../modules/foot.nix
  ];

  home.packages = with pkgs; [
    (opera.override { proprietaryCodecs = true; })
    (opera-gx.override { proprietaryCodecs = true; })

    obsidian

    #texlive.combined.scheme-full

    anki
  ];
  
}