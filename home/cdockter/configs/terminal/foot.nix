{
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      cursor = {
        style = "beam";
        blink = "yes";
      };
      main = {
        term = "xterm-256color";
      };
    };
  };
}