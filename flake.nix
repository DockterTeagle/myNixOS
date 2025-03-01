{
  description = "my main flake";
  # inputs = let
  #   hyprland = ./inputs/hyprland.nix;
  # in
  inputs = {
    # Core Nix Packages and Flakes
    # nixos-unified = {
    #   url = "github:srid/nixos-unified";
    #   # inputs={
    #   #   nixpkgs.follows = "nixpkgs";
    #   # };
    # };
    std = {
      url = "github:divnix/std";
      inputs = {
        yants.follows = "yants";
        paisano.follows = "paisano";
        lib.follows = "nixpkgs";
        nixpkgs.follows = "nixpkgs";
      };
    };
    nur = {
      url = "github:nix-community/nur";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.follows = "treefmt-nix";
      };
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix.url = "github:nixos/nix";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL/main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-compat.follows = "flake-compat";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    alejandra = {
      url = "github:kamadorueda/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    #Boot
    ##Secure boot
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-parts.follows = "flake-parts";
    };
    ##Disk allocation
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Development Tools and Utilities
    ## Pre-commit hooks for Git
    git-hooks-nix.url = "github:cachix/git-hooks.nix";
    devenv.url = "github:cachix/devenv";
    ##lsp
    nixd = {
      url = "github:nix-community/nixd";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.follows = "treefmt-nix";
      };
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    solaar = {
      url = "github:svenum/solaar-flake/main";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "flake-compat";
        snowfall-lib.follows = "snowfall-lib";
      };
    };

    # Wayland and GUI Tools
    nixpkgs-wayland = {
      url = "github:nix-community/nixpkgs-wayland";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        flake-compat.follows = "flake-compat";
        lib-aggregate.follows = "lib-aggregate";
      };
    };
    ##Hyprland
    hyprland.url = "github:hyprwm/Hyprland"; #uses cachix so won't override
    hyprlock.url = "github:hyprwm/hyprlock";
    hy3 = {
      url = "github:outfoxxed/hy3";
      inputs.hyprland.follows = "hyprland";
    };
    # ez-configs.url = "github:ehllie/ez-configs";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    nixcord = {
      url = "github:kaylorben/nixcord";
      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
        treefmt-nix.follows = "treefmt-nix";
      };
    };
    stylix = {
      url = "github:danth/stylix";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        nur.follows = "nur";
        flake-compat.follows = "flake-compat";
        flake-utils.follows = "flake-utils";
        git-hooks.follows = "git-hooks-nix";
        home-manager.follows = "home-manager";
      };
    };
    #Terminal
    nh.url = "github:viperML/nh";
    #Used exclusively for firefox
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    yazi = {
      url = "github:sxyazi/yazi"; #uses cache so dont override
      # inputs = {
      #   flake-utils.follows = "flake-utils";
      #   nixpkgs.follows = "nixpkgs";
      # };
    };
    ghostty.url = "github:ghostty-org/ghostty";
    ## Neovim Configurations and Overlays
    # nvimconfig.url = "github:DockterTeagle/mynvimconfig";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay"; #uses cache so dont override
    nix-gaming.url = "github:fufexan/nix-gaming"; #uses cachix, dont override
    nix-topology.url = "github:oddlama/nix-topology";
    #to minimize duplicated packages
    lib-aggregate = {
      url = "github:nix-community/lib-aggregate";
      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs-lib.follows = "nixpkgs";
      };
    };
    flake-utils.url = "github:numtide/flake-utils";
    flake-utils-plus = {
      url = "github:gytis-ivaskevicius/flake-utils-plus";
      inputs.flake-utils.follows = "flake-utils";
    };
    flake-compat.url = "https://flakehub.com/f/edolstra/flake-compat/1.tar.gz";
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs = {
        flake-compat.follows = "flake-compat";
        nixpkgs.follows = "nixpkgs";
        flake-utils-plus.follows = "flake-utils-plus";
      };
    };
    paisano = {
      url = "github:divnix/paisano";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        yants.follows = "yants";
      };
    };
    yants = {
      url = "github:divnix/yants";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    home-manager,
    nixpkgs,
    flake-parts,
    self,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = nixpkgs.lib.systems.flakeExposed;
      debug = true;
      imports = with inputs; [
        git-hooks-nix.flakeModule
        treefmt-nix.flakeModule
        devenv.flakeModule
        # ez-configs.flakeModule
        nix-topology.flakeModule
        std.flakeModule
      ];
      # ezConfigs = {
      #   globalArgs = let
      #     nixosSettings = {
      #       system = "x86_64-linux";
      #       hostName = "nixos";
      #       timezone = "America/Chicago";
      #       WSL = false;
      #     };
      #     nixosWSLSettings =
      #       nixosSettings
      #       // {
      #         hostName = "NixOS-WSL";
      #         WSL = true;
      #       };
      #
      #     # Determine the profile: if the environment variable is empty, default to "nixos"
      #     profile = let
      #       p = builtins.getEnv "NIXOS_POFILE";
      #     in
      #       if p != ""
      #       then p
      #       else "nixos";
      #     systemSettings =
      #       if profile == "wsl"
      #       then nixosWSLSettings
      #       else nixosSettings;
      #
      #     pkgs = import nixpkgs {
      #       inherit (systemSettings) system;
      #       config = {
      #         nvidia.acceptLicense = true;
      #         allowUnfreePredicate = pkg:
      #           builtins.elem (nixpkgs.lib.getName pkg) [
      #             "nvidia-x11"
      #             "nvidia-persistenced"
      #             "nvidia-settings"
      #             "discord"
      #             "steam-unwrapped"
      #             "steam"
      #             "nvidia_driver"
      #             "xow_dongle-firmware"
      #             "obsidian"
      #             "spotify"
      #             "intel-ocl"
      #             "fakespot-fake-reviews-amazon"
      #             "onetab"
      #           ];
      #         allowSubstitutes = false;
      #       };
      #       overlays = with inputs; [
      #         neovim-nightly-overlay.overlays.default
      #         nixpkgs-wayland.overlay
      #         nh.overlays.default
      #         hyprpanel.overlay
      #         yazi.overlays.default
      #         alejandra.overlay
      #       ];
      #     };
      #
      #     SystemModules = with inputs; [
      #       ./configuration.nix
      #       hyprland.nixosModules.default
      #       solaar.nixosModules.default
      #       lanzaboote.nixosModules.lanzaboote
      #       stylix.nixosModules.stylix
      #       disko.nixosModules.disko
      #       sops-nix.nixosModules.sops
      #       nix-gaming.nixosModules.pipewireLowLatency
      #       nix-gaming.nixosModules.platformOptimizations
      #       nixos-wsl.nixosModules.default
      #     ];
      #
      #     cdockterSettings = {
      #       username = "cdockter";
      #       description = "Christopher Ryan Dockter";
      #       email = "65212972+DockterTeagle@users.noreply.github.com";
      #       wm = "hyprland";
      #       term = "ghostty";
      #       editor = "nvim";
      #       font = "JetBrainsMono NF";
      #       nerdfont = "jetbrains-mono";
      #       homeDirectory = "/home/cdockter";
      #       cursorPackage = pkgs.bibata-cursors;
      #       cursorName = "Bibata-Modern-Ice";
      #       cursorSize = 24;
      #     };
      #
      #     # Common arguments for nixosConfigurations
      #     specialArgs = {inherit inputs systemSettings cdockterSettings;};
      #   in {inherit pkgs specialArgs;};
      #   home = {
      #     configurationsDirectory = ./home;
      #     extraSpecialArgs = {};
      #     users = {
      #       cdockter = {
      #         standalone = {
      #           enable = true;
      #           pkgs = pkgs;
      #         };
      #       };
      #     };
      #   };
      # };
      perSystem = {
        inputs',
        pkgs,
        config,
        ...
      }: {
        treefmt = import ./flakeModules/treefmt.nix {inherit inputs' self pkgs;};
        topology.modules = [
          ./flakeModules/topology.nix
          {inherit (self) nixosConfigurations;}
        ];
        devenv = import ./flakeModules/devenv.nix {
          inherit self inputs' pkgs;
          inherit (config) treefmt;
        };
      };
      flake = let
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
            nix.overlays.default
            neovim-nightly-overlay.overlays.default
            nixpkgs-wayland.overlay
            nh.overlays.default
            hyprpanel.overlay
            hyprlock.overlays.default
            yazi.overlays.default
            alejandra.overlay
          ];
        };

        SystemModules = with inputs; [
          ./configuration.nix
          solaar.nixosModules.default
          lanzaboote.nixosModules.lanzaboote
          stylix.nixosModules.stylix
          disko.nixosModules.disko
          sops-nix.nixosModules.sops
          nix-gaming.nixosModules.pipewireLowLatency
          nix-gaming.nixosModules.platformOptimizations
          nixos-wsl.nixosModules.default
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
        specialArgs = {inherit inputs systemSettings cdockterSettings self;};
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
              ./home/cdockter/home.nix
              stylix.homeManagerModules.stylix
              hyprpanel.homeManagerModules.hyprpanel
              nixcord.homeManagerModules.nixcord
              sops-nix.homeManagerModules.sops
            ];
          };
        };
      };
    };
}
