{ lib, ... }:
{
  options.programs.gui = {
    enable = lib.mkEnableOption "Enable the GUI";
  };
  imports = [
    ./shared
    # ./GUI-Enabled
    ./TUI-Only
  ];
}
