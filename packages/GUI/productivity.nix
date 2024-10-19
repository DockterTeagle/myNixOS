{ pkgs, ... }:
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
    solaar = {
      enable = true;
    };
  };
  environment = {
    etc."logid.cfg".text = ''
        devices: ({
          name: "MX Master 3";

          dpi: 2000;

          smartshift: {
              on: true;
              threshold: 30;
          };

          hiresscroll: {
              hires: false;
              invert: false;
              target: false;
              up: {
                  mode: "Axis";
                  axis: "REL_WHEEL";
                  axis_multiplier: 1;
                  },
              down: {
                  mode: "Axis";
                  axis: "REL_WHEEL";
                  axis_multiplier: -1;
              },
          };

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
                                  keys: ["KEY_LEFTMETA", "KEY_UP"];
                              };
                          },
                          {
                              direction: "Down";
                              mode: "OnRelease";
                              action =
                              {
                                  type: "Keypress";
                                  keys: ["KEY_LEFTMETA", "KEY_DOWN"];
                              };
                          },
                          {
                              direction: "Left";
                              action =
                              {
                                  type: "Keypress";
                                  keys: ["KEY_LEFTMETA", "KEY_LEFT"];
                              };
                          },
                          {
                              direction: "Right";
                              action =
                              {
                                  type: "Keypress";
                                  keys: ["KEY_LEFTMETA", "KEY_RIGHT"];
                              };
                          },
                          {
                              direction: "None";
                              mode: "OnRelease";
                              action =
                              {
                                  type: "Keypress";
                                  keys: ["KEY_LEFTMETA"];
                              }
                          }
                      );
                  };
              }
          );
      })

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
