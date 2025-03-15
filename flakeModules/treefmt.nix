{self', ...}: {
  flakeFormatter = true;
  programs = {
    alejandra = {
      enable = true;
    };
    beautysh = {
      enable = true;
    };
    prettier = {
      enable = true;
    };
  };
  build = {
    check = self';
  };
}
