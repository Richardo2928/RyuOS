{ username, ...}:
{
  # All of this is evaluated in the context of the nixosConfigurations,
  # so we can use the username variable to use the xdg.configFile option
  # to set the source of the config files to the local files in this directory.
  home-manager.users.${username}.xdg.configFile."niri/config.kdl".source = ./config.kdl;
  home-manager.users.${username}.xdg.configFile."niri/input.kdl".source = ./input.kdl;
  home-manager.users.${username}.xdg.configFile."niri/outputs.kdl".source = ./outputs.kdl;
  home-manager.users.${username}.xdg.configFile."niri/layout.kdl".source = ./layout.kdl;
  home-manager.users.${username}.xdg.configFile."niri/window-rules.kdl".source = ./window-rules.kdl;
  home-manager.users.${username}.xdg.configFile."niri/bindings.kdl".source = ./bindings.kdl;

  # On a regular home-manager configuration or a nix file but evaluated in the context
  # of the home-manager configuration (imported in the nixosConfigurations modules),
  # we would "raw dog" the config files like this:
  # xdg.configFile."niri/config.kdl".source = ./config.kdl
  # xdg.configFile."niri/input.kdl".source = ./input.kdl
  # etc...
}