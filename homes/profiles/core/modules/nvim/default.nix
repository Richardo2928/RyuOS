{ pkgs, ryuosRoot, config, ... }:
{
  home.packages = with pkgs; [
    neovim
  ];

  xdg.configFile."nvim/init.lua".source = config.lib.file.mkOutOfStoreSymlink "${ryuosRoot}/homes/profiles/core/modules/nvim/init.lua";
  xdg.configFile."nvim/lua".source = config.lib.file.mkOutOfStoreSymlink "${ryuosRoot}/homes/profiles/core/modules/nvim/lua";
  xdg.configFile."nvim/lazy-lock.json".source = config.lib.file.mkOutOfStoreSymlink "${ryuosRoot}/homes/profiles/core/modules/nvim/lazy-lock.josn";
}
