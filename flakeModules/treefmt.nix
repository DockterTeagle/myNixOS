{
  treefmt = {
    flakeFormatter = true;
    programs = {
      mdformat.enable = true;
      nufmt = {
        enable = true;
      };
      alejandra = {
        enable = true;
      };
      beautysh.enable = true;
    };
  };
}
