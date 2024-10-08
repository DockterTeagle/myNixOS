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
            name:"Wireless Mouse MX Master 3";
            smartshift:
      {
          on: true;
          threshold: 30;
          torque: 50;
      };
      hiresscroll:
      {
          hires: true;
          invert: false;
          target: false;
      };
      dpi: 1000;

      buttons: (
          {
              cid: 0xc3;
              action =
              {
                  type: "Gestures";
                  gestures: (
                      {
                          direction: "Up";
                          mode: "OnRelease";
                          action =
                          {
                              type: "Keypress";
                              keys: ["KEY_UP"];
                          };
                      },
                      {
                          direction: "Down";
                          mode: "OnRelease";
                          action =
                          {
                              type: "Keypress";
                              keys: ["KEY_DOWN"];
                          };
                      },
                      {
                          direction: "Left";
                          mode: "OnRelease";
                          action =
                          {
                              type: "CycleDPI";
                              dpis: [400, 600, 800, 1000, 1200, 1400, 1600];
                          };
                      },
                      {
                          direction: "Right";
                          mode: "OnRelease";
                          action =
                          {
                              type = "ToggleSmartshift";
                          }
                      },
                      {
                          direction: "None"
                          mode: "NoPress"
                      }
                  );
              };
          },
          {
              cid: 0xc4;
              action =
              {
                  type: "Keypress";
                  keys: ["KEY_A"];
              };
          }
      );
          }
        );
    '';
    systemPackages = with pkgs;[
      element-desktop-wayland
      zoom-us
      logiops
      # nur.repos.tuxdude.logiops
      evdevremapkeys
      # libreoffice
      # thunderbird
    ];
  };
}
