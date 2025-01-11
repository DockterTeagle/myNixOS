{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    fangfrisch
  ];
  services.clamav = {
    daemon.enable = true;
    updater = {
      enable = true;
      frequency = 12;
    };
    scanner.enable = true;
    fangfrisch = {
      # interval = "10min";
      enable = true;
      # settings = { securiteinfo = «thunk»; };
    };
  };
}
