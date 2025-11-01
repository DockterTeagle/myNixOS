{ config, ... }:
{
  services.recoll = {
    enable = true;
    configDir = "${config.xdg.configHome}/recoll";
    settings = {
      topdirs = [
        "~/Downloads"
        "~/Documents"
      ];
      "~/Documents" = {
        "skippedNames+" = [
          "node_modules"
          "target"
          "result"
        ];
      };
    };
  };
}
