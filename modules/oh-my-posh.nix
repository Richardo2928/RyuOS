{ pkgs, palette, ... }:
{
  
  programs.oh-my-posh = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      "$schema" = "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/schema.json";

      secondary_prompt = {
        template = "╰─\uf105 ";
        foreground = "#${palette.green_medium}";
        background = "transparent";
      };

      transient_prompt = {
        template = "\ue285 ";
        foreground = "#${palette.green_medium}";
        background = "transparent";
      };

      console_title_template = "[{{ if .Root }}root @ {{ end }}{{ .Shell }} -- in -> {{ .Folder }}]";

      blocks = [
        {
          type = "prompt";
          alignment = "right";
          segments = [
            {
              properties = { always_enabled = true; };
              template = " /\\_____/\\ ";
              foreground = "#${palette.green_medium}";
              type = "text";
              style = "plain";
            }
          ];
        }

        {
          type = "prompt";
          alignment = "right";
          segments = [
            {
              properties = { always_enabled = true; };
              template = "{{ if gt .Code 0 }}(-[<#${palette.red_primary}>0</>].[<#${palette.red_primary}>0</>]-){{ else }}(-[<#${palette.green_medium}> </>].[<#${palette.green_medium}> </>]-){{ end }}";
              foreground = "#${palette.green_medium}";
              type = "text";
              style = "plain";
            }
          ];
          newline = true;
        }

        {
          type = "prompt";
          alignment = "left";
          segments = [
            {
              properties = {
                alpine = "\uf300";
                arch = "\uf303";
                centos = "\uf304";
                debian = "\uf306";
                elementary = "\uf309";
                fedora = "\uf30a";
                gentoo = "\uf30d";
                linux = "\ue712";
                macos = "\ue711";
                manjaro = "\uf312";
                mint = "\uf30f";
                opensuse = "\uf314";
                raspbian = "\uf315";
                ubuntu = "\uf31c";
                windows = "\ue70f";
              };
              leading_diamond = "\ue0b2";
              template = " {{ if .WSL }}\ue712 on {{ end }}{{ .Icon }} ";
              foreground = "#${palette.green_medium}";
              background = "#${palette.bg_hard}";
              type = "os";
              style = "diamond";
            }
            {
              leading_diamond = "\ue0b2";
              template = " <#${palette.green_medium}>\ueb99</> {{ .UserName }} <#${palette.green_medium}>::</> <#${palette.green_medium}>\uf108</> {{ .HostName }} ";
              foreground = "#${palette.blue_primary}";
              background = "#${palette.bg_elevated}";
              type = "session";
              style = "diamond";
            }
            {
              template = " \uf489 {{ .Name }} ";
              foreground = "#${palette.black_hard}";
              powerline_symbol = "\ue0b0";
              background = "#${palette.green_medium}";
              type = "shell";
              style = "powerline";
            }
            {
              template = " \uf09c admin ";
              foreground = "#${palette.black_hard}";
              powerline_symbol = "\ue0b0";
              background = "#${palette.green_medium}";
              type = "root";
              style = "powerline";
            }
            {
              template = " \ue61e \ue61d cmake {{ .Full }} ";
              foreground = "#${palette.black_hard}";
              powerline_symbol = "\ue0b0";
              background = "#${palette.green_medium}";
              type = "cmake";
              style = "powerline";
            }
            {
              properties = { display_mode = "context"; };
              template = " \ue73c {{ if .Venv }}{{ .Venv }} {{ end }}{{ .Full }} ";
              foreground = "#${palette.black_hard}";
              powerline_symbol = "\ue0b0";
              background = "#${palette.green_medium}";
              type = "python";
              style = "powerline";
            }
            {
              template = " \u202d\ue626 {{ .Full }} ";
              foreground = "#${palette.black_hard}";
              powerline_symbol = "\ue0b0";
              background = "#${palette.green_medium}";
              type = "go";
              style = "powerline";
            }
            {
              template = " \ue7a8 {{ .Full }} ";
              foreground = "#${palette.black_hard}";
              powerline_symbol = "\ue0b0";
              background = "#${palette.green_medium}";
              type = "rust";
              style = "powerline";
            }
            {
              properties = {
                branch_icon = "\ue725 ";
                fetch_stash_count = true;
                fetch_status = true;
                fetch_upstream_icon = true;
                fetch_worktree_count = true;
              };
              template = " {{ .UpstreamIcon }}{{ .HEAD }}{{if .BranchStatus }} {{ .BranchStatus }}{{ end }}{{ if .Working.Changed }} \uf044 {{ .Working.String }}{{ end }}{{ if and (.Working.Changed) (.Staging.Changed) }} |{{ end }}{{ if .Staging.Changed }} \uf046 {{ .Staging.String }}{{ end }}{{ if gt .StashCount 0 }} \ueb4b {{ .StashCount }}{{ end }} ";
              foreground = "#${palette.green_medium}";
              powerline_symbol = "\ue0b0";
              background = "#${palette.bg_hard}";
              type = "git";
              style = "powerline";
              background_templates = [
                "{{ if or (.Working.Changed) (.Staging.Changed) }}#${palette.bg_high}{{ end }}"
                "{{ if and (gt .Ahead 0) (gt .Behind 0) }}#${palette.bg_high}{{ end }}"
                "{{ if gt .Ahead 0 }}#${palette.bg_subtle}{{ end }}"
                "{{ if gt .Behind 0 }}#${palette.bg_subtle}{{ end }}"
              ];
            }
          ];
          newline = true;
        }

        {
          type = "prompt";
          alignment = "right";
          segments = [
            {
              foreground = "#${palette.green_medium}";
              foreground_templates = [
                "{{if eq \"Charging\" .State.String}}#${palette.blue_medium}{{end}}"
                "{{if eq \"Discharging\" .State.String}}#${palette.orange_primary}{{end}}"
                "{{if eq \"Full\" .State.String}}#${palette.green_medium}{{end}}"
              ];
              properties = {
                charged_icon = "<#ffffff>\ue22f</> ";
                charging_icon = "\ueb2d ";
                discharging_icon = "<#ffff00>\uf244</> ";
              };
              style = "plain";
              template = "--[{{ if not .Error }}{{ .Icon }}{{ .Percentage }}{{ end }}{{ .Error }}\uf295]--";
              type = "battery";
            }
          ];
        }

        {
          type = "prompt";
          alignment = "left";
          segments = [
            {
              template = "╭─";
              foreground = "#${palette.fg_primary}";
              type = "text";
              style = "plain";
            }
            {
              properties = {
                time_format = "<#${palette.fg_primary}>[ \ue641 15:04:05 ]</> <#${palette.green_medium}>[ </> \uf073 2 Jan, Monday <#${palette.green_medium}>]</> ";
              };
              template = "{{ .CurrentDate | date .Format }}";
              foreground = "#${palette.green_medium}";
              type = "time";
              style = "plain";
            }
          ];
          newline = true;
        }

        {
          type = "prompt";
          alignment = "right";
          segments = [
            {
              properties = { always_enabled = true; };
              leading_diamond = "\ue0b6";
              template = "\ue266 ";
              foreground = "#${palette.bg_elevated}";
              background = "#${palette.cyan_primary}";
              type = "text";
              style = "diamond";
            }
            {
              properties = {
                style = "roundrock";
                threshold = 0;
              };
              trailing_diamond = "\ue0b4";
              template = "RAM: {{ (div ((sub .PhysicalTotalMemory .PhysicalAvailableMemory)|float64) 1073741824.0) }}/{{ (div .PhysicalTotalMemory 1073741824.0) }}GB";
              foreground = "#${palette.blue_primary}";
              background = "#${palette.bg_hard}";
              type = "sysinfo";
              style = "diamond";
            }
            {
              properties = { always_enabled = true; };
              leading_diamond = "\ue0b6";
              template = " {{ if gt .Code 0 }}\uf00d{{ else }}\uf00c{{ end }} ";
              foreground = "#${palette.green_medium}";
              background = "#${palette.bg_elevated}";
              type = "status";
              style = "diamond";
              foreground_templates = [ "{{ if gt .Code 0 }}#${palette.fg_primary}{{ end }}" ];
              background_templates = [ "{{ if gt .Code 0 }}#${palette.red_primary}{{ end }}" ];
            }
            {
              properties = {
                style = "roundrock";
                threshold = 0;
              };
              trailing_diamond = "\ue0b4";
              template = " \uf252 {{ .FormattedMs }} ";
              foreground = "#${palette.blue_primary}";
              background = "#${palette.bg_subtle}";
              type = "executiontime";
              style = "diamond";
            }
          ];
        }

        {
          type = "prompt";
          alignment = "left";
          segments = [
            {
              template = "├─";
              foreground = "#${palette.fg_primary}";
              type = "text";
              style = "plain";
            }
            {
              properties = {
                folder_icon = " \uf07c ";
                folder_separator_icon = " \uf061 ";
                home_icon = "\ueb06 ";
                max_depth = 3;
                style = "agnoster_short";
              };
              leading_diamond = "[<#${palette.green_medium}> \uf07b </><#${palette.blue_primary}> in </>";
              template = " {{ .Path }} <#${palette.fg_primary}>]</>";
              foreground = "#${palette.blue_primary}";
              type = "path";
              style = "diamond";
            }
          ];
          newline = true;
        }

        {
          type = "prompt";
          alignment = "left";
          segments = [
            {
              template = "╰─";
              foreground = "#${palette.fg_primary}";
              type = "text";
              style = "plain";
            }
            {
              properties = { always_enabled = true; };
              template = "❯ ";
              foreground = "#${palette.green_medium}";
              type = "status";
              style = "plain";
            }
          ];
          newline = true;
        }
      ];

      version = 3;
      final_space = true;
    };
  };

}
