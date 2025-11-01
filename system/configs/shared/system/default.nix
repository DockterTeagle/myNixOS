{
  zramSwap = {
    enable = true;
    memoryPercent = 75;
  };
  imports = [
    ./bootloader
  ];
}
