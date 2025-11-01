{
  description = "My nixos flake";
  inputs = {
    nixos-hardware.url = "github:NixOS/nixos-hardware";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    disko.url = "github:nix-community/disko";
    flake-parts.url = "github:hercules-ci/flake-parts";
    ghostty.url = "github:ghostty-org/ghostty";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neorocks.url = "github:nvim-neorocks/neorocks";
    nix-index-database.url = "github:nix-community/nix-index-database";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    sops-nix.url = "github:Mic92/sops-nix";
    ## Hyprland
    hyprland.url = "github:hyprwm/Hyprland/7e1e24fea615503a3cc05218c12b06c1b6cabdc7"; # uses cachix so won't override
    hyprshell = {
      url = "github:H3rmt/hyprshell";
      inputs = {
        hyprland.follows = "hyprland";
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    # split-monitor-workspaces = {
    #   url = "github:Duckonaut/split-monitor-workspaces";
    #   inputs.hyprland.follows = "hyprland";
    # };
    stylix.url = "github:nix-community/stylix"; # I want to replace
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.home-manager.follows = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      debug = true;
      imports = with inputs; [
        ./flake
        home-manager.flakeModules.default
        disko.flakeModules.default
      ];
      flake =
        let
          pkgs = import inputs.nixpkgs {
            system = "x86_64-linux";
            config = {
              nvidia.acceptLicense = true;
              allowUnfree = true;
              allowSubstitutes = false;
            };
            overlays = with inputs; [ neorocks.overlays.default ];
          };
          config = import ./globals { inherit inputs pkgs; };
          inherit (config) cdockterSettings;

        in
        {
          diskoConfigurations = {
            msi = {
              disko.devices = {
                disk = {
                  EHDD = {
                    type = "disk";
                    device = "/dev/sdb";
                    content = {
                      type = "gpt";
                      partitions = {
                        luks = {
                          size = "100%";
                          label = "luksEHDD";
                          content = {
                            type = "luks";
                            name = "cryptHDD";
                            settings.allowDiscards = true;
                            extraOpenArgs = [
                              "--allow-discards"
                              "--perf-no_read_workqueue"
                              "--perf-no_write_workqueue"
                            ];
                            settings = {
                              crypttabExtraOpts = [
                                "fido2-device=auto"
                                "token-timeout=10"
                              ];
                            };
                            content = {
                              type = "filesystem";
                              format = "ext4";
                              mountpoint = "/Drives/EHDD";
                            };
                          };
                        };
                      };
                    };
                  };
                  nvme0n1 = {
                    type = "disk";
                    device = "/dev/nvme0n1";
                    content = {
                      type = "gpt";
                      partitions = {
                        ESP = {
                          name = "ESP";
                          size = "500M";
                          type = "EF00";
                          content = {
                            type = "filesystem";
                            format = "vfat";
                            mountpoint = "/boot";
                            mountOptions = [
                              "umask=0077"
                            ];
                          };
                        };
                        luks = {
                          size = "100%";
                          label = "luksBase";
                          content = {
                            type = "luks";
                            name = "cryptroot";
                            settings.allowDiscards = true;
                            extraOpenArgs = [
                              "--allow-discards"
                              "--perf-no_read_workqueue"
                              "--perf-no_write_workqueue"
                            ];
                            settings = {
                              crypttabExtraOpts = [
                                "fido2-device=auto"
                                "token-timeout=10"
                              ];
                            };
                            content = {
                              type = "filesystem";
                              format = "ext4";
                              mountpoint = "/";
                            };
                          };
                        };
                      };
                    };
                  };
                };
              };
            };
          };
          nixosConfigurations = {
            nixos = inputs.nixpkgs.lib.nixosSystem {
              inherit pkgs;
              specialArgs = {
                inherit
                  inputs
                  cdockterSettings
                  ;
              };
              modules = with inputs; [
                ./system
                chaotic.nixosModules.default
                stylix.nixosModules.stylix
                disko.nixosModules.disko # make me the flake-parts module
              ];
            };

          };
          homeConfigurations = {
            cdockter = inputs.home-manager.lib.homeManagerConfiguration {
              inherit pkgs;
              extraSpecialArgs = {
                inherit
                  inputs
                  cdockterSettings
                  ;
              };
              modules = with inputs; [
                ./home/cdockter
                zen-browser.homeModules.twilight
                stylix.homeModules.stylix
                sops-nix.homeManagerModules.sops
                nix-index-database.homeModules.nix-index
              ];
            };
          };
        };
    };
}
