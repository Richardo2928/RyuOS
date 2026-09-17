{ username, username, ryuosRoot, ... }:
let
  niriDir = "${ryuosRoot}/hosts/profiles/rices/modules/niri";
  outPutsFile = "${niriDir}/outputs.d/${config.networking.hostName}.kdl";
in
{
  home-manager.users.${username} = { config, ... }:
  let link = config.lib.file.mkOutOfStoreSymlink; in {
    xdg.configFile."niri/config.kdl" = link "${niriDir}/config.kdl";
    xdg.configFile."niri/outputs.kdl" = link outPutsFile;
    xdg.configFile."niri/layout.kdl" = link "${niriDir}/layout.kdl";
    xdg.configFile."niri/window-rules.kdl" = link "${niriDir}/window-rules.kdl";
    xdg.configFile."niri/bindings.kdl" = link "${niriDir}/bindings.kdl";
  };
}
