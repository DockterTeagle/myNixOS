{
  inputs',
  self',
  ...
}: {
  flakeFormatter = true;
  programs = {
    nufmt = {
      enable = true;
      package = inputs'.nufmt.packages.default;
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
