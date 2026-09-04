{ pkgs, ... }:
{
  home.packages = with pkgs; [
    thunar

    onlyoffice-desktopeditors
    drawio

    spotify
    amberol

    discord
    zoom-us

    krita
    inkscape
    obs-studio
    #openshot-qt #* doesn't have maintainers

    steam
    melonds
    
    normcap

    vscode
  ];
}