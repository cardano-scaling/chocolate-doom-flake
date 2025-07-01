{ inputs, ... }: {
  perSystem = { pkgs, ... }: {
    doom."default" = {
      inherit (pkgs.chocolate-doom) src;
      iwad = [ (inputs.self + /freedoom.wad) ];
    };
  };
}
