let
  recursiveImportModules = dir: attrs:
    let
      ignoreNames = attrs.ignoreNames or [ "default.nix" ];
      entries = builtins.readDir dir;
      entryNames = builtins.attrNames entries;
    in builtins.concatLists (map (name:
      let
        type = entries.${name};
        path = dir + "/${name}";
      in if type == "directory" then
           if builtins.pathExists "${path}/default.nix" then
             [ (import path) ]
           else
             recursiveImportModules path attrs
         else if type == "regular" && builtins.match ".*\\.nix$" name != null then
           if builtins.elem name ignoreNames then [] else [ (import path) ]
         else
           []
    ) entryNames);
in
{
  recursiveImportModules = recursiveImportModules;
}
