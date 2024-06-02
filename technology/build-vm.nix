{ config, pkgs, ... }:
{
  imports = [
    ../configuration.nix
  ];

  users.extraUsers.tester.password = "tester";
  users.mutableUsers = false;
}
