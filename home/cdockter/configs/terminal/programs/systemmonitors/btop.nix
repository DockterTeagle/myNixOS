{pkgs, ...}: {
  programs.btop = {
    enable = true;
    package = pkgs.btop.override {cudaSupport = true;};
    settings = {
      vim_keys = true;
      update_ms = 100;
      shown_boxes = "proc cpu mem net gpu1";
    };
  };
}
