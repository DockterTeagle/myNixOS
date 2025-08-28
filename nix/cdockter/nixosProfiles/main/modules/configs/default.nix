{
  pkgs,
  inputs,
  ...

}:
{
  # Imports
  imports = [
    ./shared
    ./GUI-Enabled
  ];
  # imports = [
  #   # cell.nixosProfiles
  #   ./packages
  #   ./secrets
  #   ./configs
  # ];

  # Time and Locale
  time.timeZone = "America/Chicago";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_US.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  # Users
  users.users = {
    cdockter = {
      shell = pkgs.fish;
      isNormalUser = true;
      description = "Dockter";
      # hashedPasswordFile = config.sops.secrets.cdockter_password.path;
      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
      ];
    };
  };

  # Programs
  programs = {
    nh = {
      enable = true;
      package = inputs.nh.packages.${pkgs.system}.default;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep=3";
      };
      flake = "/home/cdockter/Documents/myNixOS";
    };
    fish.enable = true;
  };

  # System Auto Upgrade
  system = {
    autoUpgrade.enable = false;

    # NixOS Release Version
    stateVersion = "25.05"; # Did you read the comment?
  };
}
