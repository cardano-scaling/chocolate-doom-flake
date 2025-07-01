{

  description = "test flake";

  inputs = {
    get-flake.url = "github:ursi/get-flake";
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs: with inputs.flake-parts.lib; mkFlake { inherit inputs; } (inputs.import-tree ./modules);

}
