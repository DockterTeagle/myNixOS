{ mainUserSettings }: {
  conversions = import ./conversion.nix;
  home = mainUserSettings.home-directory;
}
