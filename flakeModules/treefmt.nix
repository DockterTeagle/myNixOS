{
  flakeFormatter = true;
  programs = {
    dprint = {
      enable = true;
      includes = ["*.md"];
      settings = {
        useTabs = false;
        incremental = true;
        plugins = ["https://plugins.dprint.dev/markdown-0.18.0.wasm"];
      };
    };
    nufmt = {
      enable = true;
    };
    alejandra = {
      enable = true;
    };
    beautysh.enable = true;
  };
}
