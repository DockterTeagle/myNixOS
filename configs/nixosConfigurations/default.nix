{
  cell,
  inputs,
  ...
}:
let
  pkgs = import inputs.nixpkgs { };
  inputs' = inputs;
in
{
  # Imports
  imports = [
    cell.nixosProfiles
    ./packages
    ./secrets
    ./configs
  ];

  # Time and Locale

  # Users
  users.users = {
    cdockter = {
      shell = pkgs.fish;
      isNormalUser = true;
      hashedPasswordFile = config.sops.secrets.cdockter_password.path;
      inherit (cdockterSettings) description;
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
      package = inputs'.nh.packages.default;
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
