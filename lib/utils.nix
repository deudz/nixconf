{ nixpkgs, home-manager, inputs }:
{
  mkNixosConfiguration = host:
    nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ ../devices/${host}/configuration.nix ];
    };
  
  mkHomeManagerConfiguration = system: host:
    home-manager.lib.homeManagerConfiguration {
      pkgs = import nixpkgs { inherit system; config.allowUnfree = true; };

      extraSpecialArgs = { inherit inputs; };
      modules = [ ../devices/${host}/home.nix ];
    };
}
