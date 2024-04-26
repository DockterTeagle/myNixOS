# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs,lib, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
      <nixos-hardware/lenovo/thinkpad/p1>
    ];
  nixpkgs.config = {
    packageOverrides = {
      unstable = import <nixos-unstable>{};
    };
    allowUnfree = true;
  };
  #home-manager
  home-manager.useUserPackages = true;
  home-manager.useGlobalPkgs = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Bootloader.
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  xdg = {
    autostart.enable = true;
    portal = {
      enable = true;
      extraPortals = lib.mkDefault[
         pkgs.xdg-desktop-portal
         pkgs.xdg-desktop-portal-gtk
      ];
    };
  };
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
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


  # Enable the GNOME Desktop Environment.


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  # sound.enable = true;
  hardware = {
    # pulseaudio.enable = false;
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
      setLdLibraryPath = true;
    };
    nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      forceFullCompositionPipeline = true;
      powerManagement.enable = true;
      prime = {
        sync.enable = true;
        intelBusId = "PCI:0:0:2";
        nvidiaBusId = "PCI:0:1:0";
      };
    };
  };

  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
      xkb.variant = "";
      # gnomeDesktop.enable = true;
      excludePackages = [pkgs.xterm ];
      videoDrivers = ["nvidia"];
      libinput.enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
    dbus.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;
    gnome = {
      sushi.enable = true;
      gnome-keyring.enable = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users = {
    cdockter = {
      shell = pkgs.zsh;
      isNormalUser = true;
      description = "Christopher Ryan Dockter";
      extraGroups = [ "networkmanager" "wheel" ];
    };
    base = {
      shell = pkgs.zsh;
      isNormalUser = true;
      description = "if shit hits the fan";
      extraGroups = [ "networkmanager" "wheel" ];
 
    };
  };

  programs.solaar.enable = true;
  programs = {
    zsh.enable = true;
    hyprland = {
      enable = true;
      xwayland = {
        enable = true;
      };
    };
     waybar = {
       enable = true;
       package = pkgs.waybar.overrideAttrs (oldAttrs: {
         mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
       });
     };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.gnome.excludePackages =with pkgs; [
    gnome.baobab      # disk usage analyzer
    gnome.cheese      # photo booth
    gnome.eog         # image viewer
    gnome.epiphany    # web browser
    gedit       # text editor
    gnome.simple-scan # document scanner
    gnome.totem       # video player
    gnome.yelp        # help viewer
    gnome.evince      # document viewer
    gnome.file-roller # archive manager
    gnome.geary       # email client
    gnome.seahorse    # password manager

    # these should be self explanatory
    gnome.gnome-calculator 
    gnome.gnome-calendar 
    gnome.gnome-characters 
    gnome.gnome-clocks 
    gnome.gnome-contacts
    gnome.gnome-font-viewer 
    gnome.gnome-logs 
    gnome.gnome-maps 
    gnome.gnome-music 
    gnome-photos 
    gnome.gnome-weather
    gnome.gnome-disk-utility
    pkgs.gnome-connections
  ];
  security = {
    doas = {
      enable = true;
      extraRules = [
      {
        users = ["cdockter" "base"];
        keepEnv = true;
        persist = true;
      }
      ];
    };
    sudo.enable = false;
    rtkit.enable = true;
  };
  environment.systemPackages = with pkgs; [
    texlive.combined.scheme-full
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    dmidecode
    rofi-wayland
    dunst
    libnotify
    swww
    gitAndTools.gitFull
    cargo
    rustc
    rustup
    tmux
    home-manager
    kitty
    polkit_gnome
    libva-utils
    fuseiso
    udiskie
    gnome.adwaita-icon-theme
    gnome.gnome-themes-extra
    nvidia-vaapi-driver
    gsettings-desktop-schemas
    swaynotificationcenter
    wlr-randr
    ydotool
    wl-clipboard
    hyprland-protocols
    swayidle
    swaylock
    xdg-desktop-portal-hyprland
    hyprpicker
    hyprpaper
    wofi
    firefox-wayland
    swww
    grim
    xdg-utils
    lshw
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    qt5.qtwayland
    qt6.qmake
    qt6.qtwayland
    adwaita-qt
    adwaita-qt6
    mkpasswd
  ];
  
  specialisation = {
    on-the-go.configuration = {
      system.nixos.tags = [ "on-the-go" ];
    hardware.nvidia = {
      prime.offload.enable = lib.mkForce true;
      prime.offload.enableOffloadCmd = lib.mkForce true;
      prime.sync.enable = lib.mkForce false;
    };
  };
    };
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true
  #use-xdg-base-directories = true;
  system.autoUpgrade.enable  = true;
  system.autoUpgrade.allowReboot  = true;
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
