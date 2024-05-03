{pkgs,inputs,...}:
{
  # programs.firefox = {
  #   enable = true;
  #   package =(pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true;}) {});
  #   profiles.cdockter = {
  #     extensions = with firefox-addons.packages."x86_64-linux";[
  #       vimium
  #     ];
  #   };
  # };
}
