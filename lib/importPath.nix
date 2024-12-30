{ config, inputs, lib, overlays, pkgs, self, unstable, userInfo, util, ... }:
let
  mkModule = { prefix, path, name, }: {
      options = {
        "${prefix}${name}Cfg".enable = lib.mkOption {
          type = lib.types.bool;
          default = true;
          description = "${name} configuration";
        };
      };
      config = lib.mkIf config."${prefix}${name}Cfg".enable
        (builtins.import path {
          inherit config inputs lib overlays pkgs self unstable userInfo util;
        });
    };

  mkModuleWrapper = uprefix: path: name:
    let
      match = builtins.toString path |> builtins.match ".*(all|darwin|linux).*";
      suffixMatch = suf: lib.hasSuffix suf userInfo.system;
      mkIfMatch = sysType: match == [sysType];
      mkIfAllMatch = sysType: mkIfMatch sysType && suffixMatch sysType;
      isDefault = name == "default.nix";
      combined = {
        prefix = if isDefault
          then lib.splitString "-" uprefix
            |> lib.lists.reverseList
            |> lib.lists.drop 1
            |> lib.lists.reverseList
            |> lib.strings.concatStringsSep "-"
          else uprefix;
        path = "${path}/${name}";
        name = if isDefault
          then ""
          else builtins.baseNameOf name |> lib.removeSuffix ".nix";
      };
    in match != null
        |> (isMatch:
          if !isMatch then null
          else if mkIfMatch "all" then [ (mkModule { inherit (combined) prefix path name; }) ]
          else if mkIfAllMatch "darwin" then [ (mkModule { inherit (combined) prefix path name; }) ]
          else if mkIfAllMatch "linux" then [ (mkModule  { inherit (combined) prefix path name; }) ]
          else null);

  checkDirRec = path: prefix:
    builtins.readDir path
      |> lib.mapAttrsToList (name: type:
        if type == "directory" then
          checkDirRec "${path}/${name}" "${prefix}${name}-"
        else if type == "regular" && lib.hasSuffix ".nix" name then
          mkModuleWrapper prefix path name
        else null)
      |> builtins.filter (x: x != null)
      |> builtins.concatLists;

  /* ImportPath imports all the subsequent files in a path converts them to modules and enables/disables them
     @param: {path}    dir     -- The directory where files are taken from
  */
  importPath = path: path
    |> builtins.baseNameOf
    |> (base: if lib.hasSuffix "home-manager" base then
        checkDirRec path "hm-"
      else
        checkDirRec path "");
in importPath
