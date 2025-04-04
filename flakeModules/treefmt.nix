{self', ...}: {
  flakeFormatter = true;
  programs = {
    nufmt = {
      enable = true;
    };
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
