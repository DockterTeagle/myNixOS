{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libgcc
    glib
    gtk2
    gcc-unwrapped
    llvm_18
    pkg-config
    clang-tools
    clang
    libclang
    rocmPackages_6.llvm.clang-unwrapped
    cmake
  ];
}
