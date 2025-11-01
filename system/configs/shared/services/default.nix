#TODO: refactor me out
{ ... }:
{
  imports = [ ./solaar.nix ];
  services = {
    gnome.gnome-keyring.enable = true;
    hardware = {
      openrgb.enable = true;
      bolt.enable = true;
    };
    scx.enable = true;
    fwupd.enable = true;
    libinput.enable = true;
    tumbler.enable = true;
    pcscd.enable = true;
    kanata = {
      enable = true;
      keyboards.default = {
        config = ''
              (defsrc
          caps)
              (defalias escctrl (tap-hold 100 100 esc lctrl))
              (deflayer base 
              @escctrl
              )
        '';
      };
    };
  };
}
