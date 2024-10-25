let
  user1 = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHP6OBP6DZkLvkxAGYv9+ipc8/Nn/THtc6RHIqwLhl95 65212972+DockterTeagle@users.noreply.github.com";
  users = [user1];
in
  # system1 =
  {
    "secret1.age".publicKeys = [user1];
  }
