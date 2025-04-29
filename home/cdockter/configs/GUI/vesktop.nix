{
  programs.vesktop = {
    enable = true;
    settings = {
      appBadge = false;
      hardwareAcceleration = true;
      arRPC = true;
      checkupdates = false;
    };
    vencord = {
      settings = {
        autoUpdate = false;
        autoUpdateNotification = false;
        notifyAboutUpdates = false;
        useQuickCss = true;
        disableMinSize = true;
        plugins = {
          AnonymiseFileNames = {enabled = true;};
          FakeNitro.enabled = true;
        };
      };
    };
  };
}
