{
  inputs.dream2nix.url = "github:nix-community/dream2nix";
  inputs.dotenv = {
    url = "github:motdotla/dotenv";
    flake = false;
  };
  outputs = { self, dream2nix, dotenv }@inputs:
    let
      supportedSystems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin" ];
    in dream2nix.lib.makeFlakeOutputs {
      source = dotenv;
      systems = supportedSystems;
      config.projectRoot = ./.;
    };
}
