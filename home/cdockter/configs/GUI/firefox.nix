{ pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    profiles = {
      cdockter = {
        extensions = with pkgs.nur.repos.rycee.firefox-addons; [
          tree-style-tab
          facebook-container
          tst-more-tree-commands
          cookie-autodelete
          fakespot-fake-reviews-amazon
          private-relay
          leechblock-ng
          onetab
          ublock-origin
          multi-account-containers
          proton-pass
        ];
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
        userChrome = ''
          #TabsToolbar {
              visibility: collapse !important;
            }
        '';
      };
    };
  };
}
