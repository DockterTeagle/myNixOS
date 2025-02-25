{
  inputs,
  systemSettings,
  ...
}: {
  home.packages = with inputs; [zen-browser.packages.${systemSettings.system}.twilight];
  programs.firefox = {
    enable = true;
    profiles = {
      cdockter = {
        extensions = {
          settings = {};
          # packages = with inputs.firefox-addons.packages.${systemSettings.system}; [
          #   tree-style-tab
          #   facebook-container
          #   tst-more-tree-commands
          #   cookie-autodelete
          #   fakespot-fake-reviews-amazon
          #   private-relay
          #   leechblock-ng
          #   onetab
          #   ublock-origin
          #   multi-account-containers
          #   proton-pass
          # ];
        };
        name = "cdockter";
        isDefault = true;
        settings = {
          "privacy.trackingprotection.enabled" = true;
          "extensions.autoDisableScope" = 0;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        search = {
          default = "DuckDuckGo";
          force = true;
        };
        userChrome =
          #css
          ''
            #TabsToolbar {
                visibility: collapse !important;
              }
          '';
      };
    };
  };
}
