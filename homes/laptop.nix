{ ... }:
{
  home.username = "ricardo";
	home.homeDirectory = "/home/ricardo";

  imports = [
    ../profiles/core/soRyu.nix
    ../profiles/suites/kozoraRyu.nix
    ../profiles/suites/shinRyu.nix

    # Rice
    ../profiles/rices/kokeRyu.nix
  ];
}