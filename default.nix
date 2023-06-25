let
  sources = import ./nix/sources.nix {};
  pkgs = import sources.macaroniNix {};
in pkgs.haskell-nix.cabalProject {
  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "learn-nix";
    src = ./.;
  };
  compiler-nix-name = "ghc925";
  evalPackages = pkgs;
}
