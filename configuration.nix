# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let 
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      (import "${home-manager}/nixos")
    ];
  #home-manager
  home-manager.users.cdockter = {
    # home.packages = with pkgs; [
    #   firefox
    #   thunderbird
    #   neovim
    #   xdotool 
    #   zathura
    #   cargo
    #   rustc
    #   rustup
    #   python3
    #   tmux
    #   pstree
    #   nodejs
    #   cmake
    #   gnumake
    #   ripgrep
    #   lazygit
    #   zoxide
    #   eza
    #   wget
    #   zsh
    #   curl
    #   unzip
    #   gcc
    #   clang
    #   nerdfonts  
    #   alacritty
    # ];
    home.stateVersion = "18.09";
    programs.git= {
      enable = true;
      userName = "Dr.Teagle";
      userEmail = "chrisdockter@proton.me";
    };
    programs.zsh.oh-my-zsh = {
      enable = true;
      plugins = [
        "git" 
        "sudo"
        "colored-man-pages"
        "tmux"
        "vi-mode"
      ];
    };
  };
  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda/";
    useOSProber = true;
   # kernelParams  = ["rd.debug"];
  };
  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;


  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cdockter = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Christopher Ryan Dockter";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      feh
      firefox
      conda
      thunderbird
      neovim
      xdotool 
      zathura
      cargo
      rustc
      rustup
      python3
      tmux
      pstree
      nodejs
      cmake
      gnumake
      ripgrep
      lazygit
      zoxide
      eza
      wget
      zsh
      curl
      unzip
      gcc
      clang
      nerdfonts  
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  programs.zsh.enable = true;
  #enable hyprland
  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland.enable = true;
  };
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    texlive.combined.scheme-full
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    alacritty
    rofi-wayland
    dunst
    libnotify
    swww
    gitAndTools.gitFull
    (waybar.overrideAttrs (oldAttrs : {
      mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
      })
    )
  ];
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # enable vmware 

  virtualisation.vmware.guest.enable = true;

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
