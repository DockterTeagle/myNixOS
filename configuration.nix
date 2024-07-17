# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, systemSettings, ... }:

{
  # Imports
  imports = [
    # Include the results of the hardware scan.
    ./MSI-hardware-configuration.nix
    # Packages
    ./packages
  ];

  # Nix settings
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
    };
  };

  # Bootloader
  boot = {
    blacklistedKernelModules = [ "snd_pcsp" ]; # Consider adding module_blacklist=i915 to this to maybe disable integrated GPU
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];
  };

  # ZRAM Swap
  zramSwap.enable = true;

  # XDG settings
  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = lib.mkDefault [
        pkgs.xdg-desktop-portal-hyprland
      ];
      wlr.enable = true;
    };
  };

  # Networking
  networking = {
    networkmanager.enable = true;
    hostName = systemSettings.hostName;
    # Open ports in the firewall
    # networking.firewall.allowedTCPPorts = [ ... ];
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether
    # networking.firewall.enable = false;
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
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
  hardware = {
    enableAllFirmware = true;
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        intel-media-sdk
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
    };
    nvidia = {
      modesetting.enable = true;
      open = false;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      forceFullCompositionPipeline = true;
      prime = {
        sync.enable = true;
        intelBusId = "PCI:0:2:0"; #FIXME: these IDS are device dependant
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };

  # Services
  services = {
    dbus.enable = true;
    fwupd.enable = true;
    gvfs.enable = true;
    libinput.enable = true;
    onedrive.enable = true;
    printing.enable = true;
    tumbler.enable = true;

    # XServer and GNOME
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
      excludePackages = [ pkgs.xterm ];
      videoDrivers = [ "nvidia" ];
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
  };

  # Users
  users.users = {
    cdockter = {
      shell = pkgs.zsh;
      isNormalUser = true;
      description = "Christopher Ryan Dockter";
      extraGroups = [ "networkmanager" "wheel" "audio" "input" ];
    };
  };

  # Programs
  programs = {
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3 -v";
      flake = "/home/cdockter/MyNixOS/";
    };
    zsh.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    dconf.enable = true;
  };

  # System Environment
  environment = {
    systemPackages = with pkgs; [
      # TODO: sort all of these into the respective file
      zulu17
      yad # GUI dialog tool for shell scripts
      htop
      xclip
      nix-output-monitor
      pciutils
      gtk4
      wev
      acpi
      openssl
      sbsigntool
      openresolv
      gnome.gnome-settings-daemon
      networkmanagerapplet
      systemd # maybe not strictly necessary? try removing it and see if the system crashes
      dmidecode # get system info
      swww # animated wallpaper daemon for Wayland
      home-manager
    ];
    # etc."machine-id".source = "/nix/persist/etc/machine-id";
  };

  # Security
  security.rtkit.enable = true;

  # Specialisation
  specialisation = {
    on-the-go.configuration = {
      environment.etc."specialisation".text = "on-the-go";
      system.nixos.tags = [ "on-the-go" ];
      hardware.nvidia = {
        prime.offload.enable = lib.mkForce true;
        prime.offload.enableOffloadCmd = lib.mkForce true;
        prime.sync.enable = lib.mkForce false;
      };
    };
  };

  # System Auto Upgrade
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;

  # NixOS Release Version
  system.stateVersion = "23.11"; # Did you read the comment?
}

