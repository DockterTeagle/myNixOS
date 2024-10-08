{ ... }:
{
  home.file = {
    ".config/solaar/rules.yaml" = {
      text = ''
        rules:
          - name: "Firefox Side Scroll to Page Up/Down"
          conditions:
            - device_name: "MX Master 3"
            - application: "firefox"
          actions:
            - action: "divert"
              direction: "horizontal"
              target: "pageup"
            - action: "divert"
              direction: "horizontal"
              target: "pagedown"
      '';
    };
  };
}
