{
  inputs',
  self',
  ...
}: {
  flakeFormatter = true;
  programs = {
    alejandra = {
      enable = true;
      package = inputs'.alejandra.packages.default;
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
