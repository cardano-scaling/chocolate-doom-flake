{ inputs, ... }: {
  perSystem = { pkgs, ... }: {
    doom."default" = {
      inherit (pkgs.chocolate-doom) src;
      iwad = [ (inputs.self + /assets/freedoom1.wad) ];
    };
    doom.crispy = {
      name = "crispy-doom";
      src = inputs.crispy-doom;
      iwad = [ (inputs.self + /assets/freedoom1.wad) ];
    };
  };
}
