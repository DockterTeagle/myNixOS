{
  nixpkgs,
  home-manager,
  inputs,
  ...
}: let
  nixosSettings = {
    system = "x86_64-linux";
    hostName = "nixos";
    timezone = "America/Chicago";
    WSL = false;
  };
  nixosWSLSettings =
    nixosSettings
    // {
      hostName = "NixOS-WSL";
      WSL = true;
    };

  # Determine the profile: if the environment variable is empty, default to "nixos"
  profile = let
    p = builtins.getEnv "NIXOS_POFILE";
  in
    if p != ""
    then p
    else "nixos";
  systemSettings =
    if profile == "wsl"
    then nixosWSLSettings
    else nixosSettings;

  pkgs = import nixpkgs {
    inherit (systemSettings) system;
    config = {
      nvidia.acceptLicense = true;
      allowUnfreePredicate = pkg:
        builtins.elem (nixpkgs.lib.getName pkg) [
          "nvidia-x11"
          "nvidia-persistenced"
          "nvidia-settings"
          "discord"
          "steam-unwrapped"
          "steam"
          "nvidia_driver"
          "xow_dongle-firmware"
          "obsidian"
          "spotify"
          "intel-ocl"
          "fakespot-fake-reviews-amazon"
          "onetab"
        ];
      allowSubstitutes = false;
    };
    overlays = with inputs; [
      ghostty.overlays.default
      neovim-nightly-overlay.overlays.default
      nixpkgs-wayland.overlay
      nix.overlays.default
      nh.overlays.default
      hyprpanel.overlay
      hyprlock.overlays.default
      yazi.overlays.default
    ];
  };

  SystemModules = with inputs; [
    ../configuration.nix
    solaar.nixosModules.default
    lanzaboote.nixosModules.lanzaboote
    stylix.nixosModules.stylix
    disko.nixosModules.disko
    sops-nix.nixosModules.sops
    nix-gaming.nixosModules.pipewireLowLatency
    nix-gaming.nixosModules.platformOptimizations
    nixos-wsl.nixosModules.default
    # lix-module.nixosModules.default
  ];

  cdockterSettings = {
    username = "cdockter";
    description = "Christopher Ryan Dockter";
    email = "65212972+DockterTeagle@users.noreply.github.com";
    wm = "hyprland";
    term = "ghostty";
    editor = "nvim";
    font = "JetBrainsMono NF";
    nerdfont = "jetbrains-mono";
    homeDirectory = "/home/cdockter";
    cursorPackage = pkgs.bibata-cursors;
    cursorName = "Bibata-Modern-Ice";
    cursorSize = 24;
  };

  # Common arguments for nixosConfigurations
  specialArgs = {inherit inputs systemSettings cdockterSettings;};
in {
  nixosConfigurations = builtins.listToAttrs (map (name: {
    inherit name;
    value = nixpkgs.lib.nixosSystem {
      inherit pkgs;
      inherit specialArgs;
      modules = SystemModules;
    };
  }) ["wsl" "nixos"]);

  homeConfigurations = {
    cdockter = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = specialArgs;
      modules = with inputs; [
        ../home/cdockter/home.nix
        stylix.homeManagerModules.stylix
        hyprpanel.homeManagerModules.hyprpanel
        nixcord.homeManagerModules.nixcord
        sops-nix.homeManagerModules.sops
      ];
    };
  };
}
