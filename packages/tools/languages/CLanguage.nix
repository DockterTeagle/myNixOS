{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libgcc
    glib
    gcc-unwrapped
    llvm_18
    pkg-config
    clang-tools
    clang
    libclang
    rocmPackages_6.llvm.clang-unwrapped
    cmake
    gnumake
  ];
}
