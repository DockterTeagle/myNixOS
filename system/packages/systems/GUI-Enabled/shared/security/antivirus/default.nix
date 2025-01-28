{
  services.clamav = {
    # daemon = {
    #   enable = true;
    # }; ONLY enable if more ram, uses 1.5 GB of ram
    updater = {
      enable = true;
      frequency = 12;
      interval = "hourly";
    };
    scanner.enable = true;
    fangfrisch = {
      # interval = "10min";
      enable = true;
      # settings = { securiteinfo = thunk»; };
    };
  };
}
