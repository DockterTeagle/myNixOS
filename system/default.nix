# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  pkgs,
  cdockterSettings,
  systemSettings,
  config,
  # lib,
  ...
}: {
  # Imports
  imports = [
    ./packages
    ./secrets
  ];
  # Nix settings
  # boot.initrd.postDeviceCommands = lib.mkAfter ''
  #   mkdir /btrfs_tmp
  #   mount /dev/root_vg/root /btrfs_tmp
  #   if [[ -e /btrfs_tmp/root ]]; then
  #       mkdir -p /btrfs_tmp/old_roots
  #       timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
  #       mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
  #   fi
  #
  #   delete_subvolume_recursively() {
  #       IFS=$'\n'
  #       for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
  #           delete_subvolume_recursively "/btrfs_tmp/$i"
  #       done
  #       btrfs subvolume delete "$1"
  #   }
  #
  #   for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +30); do
  #       delete_subvolume_recursively "$i"
  #   done
  #
  #   btrfs subvolume create /btrfs_tmp/root
  #   umount /btrfs_tmp
  # '';
  #
  # fileSystems."/persist".neededForBoot = true;
  # environment.persistence."/persist/system" = {
  #   hideMounts = true;
  #   directories = [
  #     "/etc/nixos"
  #     "/var/log"
  #     "/var/lib/bluetooth"
  #     "/var/lib/nixos"
  #     "/var/lib/systemd/coredump"
  #     "/etc/NetworkManager/system-connections"
  #     {
  #       directory = "/var/lib/colord";
  #       user = "colord";
  #       group = "colord";
  #       mode = "u=rwx,g=rx,o=";
  #     }
  #   ];
  #   files = [
  #     "/etc/machine-id"
  #     {
  #       file = "/var/keys/secret_file";
  #       parentDirectory = {mode = "u=rwx,g=,o=";};
  #     }
  #   ];
  # };
  #
  # programs.fuse.userAllowOther = true;
  nix = {
    channel.enable = false;
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
        "no-url-literals"
      ];
      substituters = [
        "https://hyprland.cachix.org"
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
        "https://yazi.cachix.org"
        "https://nix-gaming.cachix.org"
        "https://ghostty.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "yazi.cachix.org-1:Dcdz63NZKfvUCbDGngQDAZq6kOroIrFoyO064uvLh8k="
        "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
        "ghostty.cachix.org-1:QB389yTa6gTyneehvqG58y0WnHjQOqgnA+wBnpWWxns="
      ];
      auto-optimise-store = true;
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

  # Services
  services = {
    dbus = {
      implementation = "broker";
      apparmor = "enabled";
    };
    fwupd.enable = true;
    gvfs.enable = true; # needed?
    libinput.enable = true;
    tumbler.enable = true;
    pcscd.enable = true;
    # XServer and GNOME
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
      };
      excludePackages = [pkgs.xterm];
      videoDrivers = [
        "nvidia"
      ];
    };
  };

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
    # nix-ld.dev.enable = true;
    gnupg = {
      # agent = {
      #   enable = true;
      #   enableSSHSupport = true;
      # };
    };
    nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep=3";
      };
      flake = "/home/cdockter/Documents/myNixOS";
    };
    fish.enable = true;
    zsh.enable = true;
  };

  wsl.enable = systemSettings.WSL;
  # System Auto Upgrade
  system = {
    autoUpgrade.enable = false;

    # NixOS Release Version
    stateVersion = "23.11"; # Did you read the comment?
  };
}
