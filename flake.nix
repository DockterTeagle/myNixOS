{
  description = "my main flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-mozilla.url = "github:mozilla/nixpkgs-mozilla";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    nixpkgs-wayland = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/nixpkgs-wayland";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # projectmgr-nvim = {
    #   url = "github:charludo/projectmgr.nvim";
    #   flake = false;
    # };
    # telescope-bibtex-nvim = {
    #   url = "github:nvim-telescope/telescope-bibtex.nvim";
    #   flake = false;
    # };
    # tiny-inline-diagnostic-nvim = {
    #   url = "github:rachartier/tiny-inline-diagnostic.nvim";
    #   flake = false;
    # };
    # nui-components-nvim = {
    #   url = "github:grapp-dev/nui-components.nvim";
    #   flake = false;
    # };
    # leap-spooky-nvim = {
    #   url = "github:ggandor/leap-spooky.nvim";
    #   flake = false;
    # };
    # nvchad = {
    #   url = "github:NvChad/NvChad";
    #   flake = false;
    # };
    # lazy-nix-helper-nvim = {
    #   url = "github:b-src/lazy-nix-helper.nvim";
    #   flake = false;
    # };
    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      systemSettings = {
        system = "x86_64-linux";
        hostName = "nixos";
        timezone = "America/Chicago";
      };
      mainUserSettings = {
        username = "cdockter";
        name = "Christopher Ryan Dockter";
        email = "chrisdockter@proton.me";
        dotfilesdir = "~/.config";
        wm = "hyprland";
        wmType = "wayland";
        browser = "firefox";
        term = "kitty";
        editor = "nvim";
        font = "JetBrains Mono Nerd Font";
        home-directory = "/home/cdockter";
        theme = "Tokyo Night";
        boot-loader = "lanzaboote";
        home-manager = inputs.home-manager;
        # ohMyPoshConfigPath = "${self}/users/cdockter/configs/terminal/oh-my-posh.json";
      };
      pkgs = import inputs.nixpkgs {
        system = systemSettings.system;
        overlays = [
          inputs.nixpkgs-mozilla.overlay
          inputs.neovim-nightly-overlay.overlays.default
          inputs.nixpkgs-wayland.overlay
          # (final: prev: {
          #   vimPlugins = prev.vimPlugins // {
          #     projectmgr-nvim = prev.vimUtils.buildVimPlugin {
          #       pname = "projectmgr-nvim";
          #       version = "latest";
          #       src = inputs.projectmgr-nvim;
          #       meta.homepage = "https://github.com/charludo/projectmgr.nvim";
          #       meta.description = "Quickly switch between projects and automate startup tasks.";
          #     };
          #     telescope-bibtex-nvim = prev.vimUtils.buildVimPlugin {
          #       pname = "telescope-bibtex-nvim";
          #       version = "latest";
          #       src = inputs.telescope-bibtex-nvim;
          #       meta.homepage = "https://github.com/nvim-telescope/telescope-bibtex.nvim";
          #       meta.description = "A telescope.nvim extension to search and paste bibtex entries into your TeX files. ";
          #     };
          #     tiny-inline-diagnostic-nvim = prev.vimUtils.buildVimPlugin {
          #       pname = "tiny-inline-diagnostic-nvim";
          #       version = "latest";
          #       src = inputs.tiny-inline-diagnostic-nvim;
          #       meta.homepage = "https://github.com/rachartier/tiny-inline-diagnostic.nvim";
          #       meta.description = "A Neovim plugin that display prettier diagnostic messages. Display one line diagnostic messages where the cursor is, with icons and colors. ";
          #     };
          #     nui-components-nvim = prev.vimUtils.buildVimPlugin {
          #       pname = "nui-components-nvim";
          #       version = "latest";
          #       src = inputs.nui-components-nvim;
          #       meta.homepage = "https://nui-components.grapp.dev/";
          #       meta.description = "A feature-rich and highly customizable library for creating user interfaces in Neovim. ";
          #     };
          #     leap-spooky-nvim = prev.vimUtils.buildVimPlugin {
          #       pname = "leap-spooky-nvim";
          #       version = "latest";
          #       src = inputs.leap-spooky-nvim;
          #       meta.homepage = "https://github.com/ggandor/leap-spooky.nvim";
          #       meta.description = "👻 Actions at a distance ";
          #     };
          #     lazy-nix-helper-nvim = prev.vimUtils.buildVimPlugin {
          #       pname = "lazy-nix-helper-nvim";
          #       version = "latest";
          #       src = inputs.lazy-nix-helper-nvim;
          #     };
          #   };
          #
          # })
        ];
        config = {
          allowUnfree = true;
          allowSubstitutes = true;
        };
      };
      home-manager = inputs.home-manager;
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit pkgs systemSettings home-manager mainUserSettings;
        };
        modules = [
          ./configuration.nix
          inputs.lanzaboote.nixosModules.lanzaboote
        ];
      };
      homeConfigurations = {
        "cdockter" = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit inputs mainUserSettings;
          };
          modules = [
            ./users/cdockter/home.nix
          ];
        };
      };
    };
}
