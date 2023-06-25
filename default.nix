let
  sources = import ./nix/sources.nix {};
  pkgs = import sources.macaroniNix {};
in pkgs.haskell-nix.project {
  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "haskell-nix-project";
    src = ./.;
  };
  compiler-nix-name = "ghc925";
  evalPackages = pkgs;
}
