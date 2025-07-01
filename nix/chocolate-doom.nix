{
  flake.flakeModule = caller:
    let inherit (caller.lib)
      mkOption
      types;
      inherit (caller.flake-parts-lib)
        mkPerSystemOption;
    in
    {
      options.perSystem = mkPerSystemOption ({ pkgs, ... }: {
        options.doom = mkOption {
          type = types.attrsOf (types.submodule ({ config, ... }: {
            options = {
              name = mkOption {
                type = types.str;
                default = "chocolate-doom";
              };
              iwad = mkOption {
                type = types.listOf types.path;
              };
              src = mkOption {
                type = types.path;
              };
              outputPackage = mkOption {
                type = types.attrs;
                default = pkgs.writers.writeBashBin config.name ''
                  ${(pkgs.chocolate-doom.overrideAttrs (old: old // { inherit (config) name src; }))}/bin/${config.name} -iwad ${builtins.concatStringsSep " " config.iwad};
                '';
              };
            };
          }));
        };
      });
      config.perSystem = { config, ... }: {
        packages = caller.lib.mapAttrs (_: doom: doom.outputPackage) config.doom;
      };
    };
}
