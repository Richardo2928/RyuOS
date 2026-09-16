{ pkgs, ... }:
{
  imports = [
    # Profiles
    # Core
    ./profiles/soRyu.nix
    # Suites
    ./profiles/kozoraRyu.nix
    ./profiles/shinRyu.nix
  ];
}
