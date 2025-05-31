{
  programs.firefox = {
    enable = true;
    profiles = {
      cdockter = {
        name = "cdockter";
        isDefault = true;
        settings = {
          "privacy.trackingprotection.enabled" = true;
          "extensions.autoDisableScope" = 0;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        search = {
          default = "ddg";
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
