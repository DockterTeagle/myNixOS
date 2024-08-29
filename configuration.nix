# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, systemSettings, mainUserSettings, inputs, ... }:

{
  # Imports
  imports = [
    # Include the results of the hardware scan.
    inputs.hyprland.nixosModules.default
    ./MSI-hardware-configuration.nix
    # Packages
    (import ./packages { inherit mainUserSettings pkgs lib config systemSettings inputs; })
  ];

  # Nix settings
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [
        "https://hyprland.cachix.org"
        "https://cache.nixos.org"
        "https://nixpkgs-wayland.cachix.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

  # XDG settings
  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
    };
  };


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

  # Hardware

  # Services
  services = {
    dbus.enable = true;
    fwupd.enable = true;
    gvfs.enable = true; #needed?
    libinput.enable = true;
    onedrive.enable = true;
    printing.enable = true;
    tumbler.enable = true;

    # XServer and GNOME
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      excludePackages = [ pkgs.xterm ];
      videoDrivers = [ "nvidia" ];
    };
  };

  # Users
  users.users = {
    cdockter = {
      shell = pkgs.zsh;
      isNormalUser = true;
      description = "Christopher Ryan Dockter";
      extraGroups = [ "networkmanager" "wheel" "audio" ];
    };
  };

  # Programs
  programs = {
    nh = {
      enable = true;
      clean =
        {
          enable = true;
          extraArgs = " --keep 3 -v";
        };
      flake = "/home/cdockter/MyNixOS/";
    };
    zsh.enable = true;
    hyprland = {
      enable = true;
    };
    dconf.enable = true;
  };

  # System Environment
  environment = {
    systemPackages = with pkgs; [
      # TODO: sort all of these into the respective file
      xclip
      pciutils
      gtk-doc
      gtk4
      gtk-doc
      gtkextra
      wev
      acpi
      openssl
      sbsigntool
      openresolv
      networkmanagerapplet
      dmidecode # get system info
      hwinfo #also get system info
      home-manager
    ];
    # etc."machine-id".source = "/nix/persist/etc/machine-id";
  };


  # Specialisation
  # specialisation = {
  #   on-the-go.configuration = {
  #     environment.etc."specialisation".text = "on-the-go";
  #     system.nixos.tags = [ "on-the-go" ];
  #     hardware.nvidia = {
  #       prime.offload.enable = lib.mkForce true;
  #       prime.offload.enableOffloadCmd = lib.mkForce true;
  #       prime.sync.enable = lib.mkForce false;
  #     };
  #   };
  # };

  # System Auto Upgrade
  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
  };

  # NixOS Release Version
  system.stateVersion = "23.11"; # Did you read the comment?
}
