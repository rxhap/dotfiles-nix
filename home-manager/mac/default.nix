{ config, pkgs, inputs, ... }:
let
  moduleImporter = import ../../recursive-nix-modules.nix;
  commonModules = moduleImporter.recursiveImportModules ./. {};
in
{
  imports = commonModules;

  home.username = "rxhap";
  home.homeDirectory = "/Users/rxhap";
}