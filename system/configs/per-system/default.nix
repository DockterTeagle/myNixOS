{lib, ...}: {
  options.programs.gui = {
    enable = lib.mkEnableOption "Enable the GUI";
  };
  imports = [
    ./GUI-Enabled
    # ./TUI-Only
  ];
}
