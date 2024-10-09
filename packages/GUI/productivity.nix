{ inputs, pkgs, ... }:
{
  hardware.logitech = {
    lcd.enable = true;
    wireless = {
      enableGraphical = true;
      enable = true;
    };
  };
  systemd.services.logid = {
    description = "Logitech Devices Daemon (logiops)";
    after = [ "network.target" ]; # Adjust as needed

    # Run logid as root
    serviceConfig = {
      ExecStart = "${pkgs.logiops}/bin/logid -c /etc/logid.cfg";
      Restart = "always";
      User = "root";
    };

    wantedBy = [ "multi-user.target" ];
    enable = true;
  };
  services = {
    # logid.enable = true;
    solaar = {
      enable = true;
    };
  };
  environment = {
    etc."logid.cfg".text = ''
          devices: (
        {
          name: "Wireless Mouse MX Master 3"
          smartshift: {
            on: true
            threshold: 30
            torque: 50
          }
          hiresscroll: {
            hires: true
            invert: false
            target: false
          }
          dpi: 1000
          thumbwheel: {
            divert: true
            left = {
              type: "Keypress", keys: ["KEY_LEFTCTRL", "KEY_TAB"]
            }
          }
    
          buttons: (
            {
              cid: 204
              action = {type: "Keypress", keys: ["KEY_LEFTCTRL", "KEY_TAB"]}
            },
          )
        }
      )

    '';
    systemPackages = with pkgs;[
      element-desktop-wayland
      zoom-us
      logiops
      # nur.repos.tuxdude.logiops
      # libreoffice
      # thunderbird
    ];
  };
}
