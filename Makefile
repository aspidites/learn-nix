.PHONY: build
build:
	nix-build -A learn-nix.components.exes.learn-nix

.PHONY: build-windows
build-windows:
	nix-build -A projectCross.mingwW64.hsPkgs.learn-nix.components.exes.learn-nix

.PHONY: run
run: build
	./result/bin/learn-nix

.PHONY: run-windows
run-windows: build-windows
	nix-shell -p wineWowPackages.stable --run 'WINE_PREFIX=~/.macaroni.nix.wine64 wine64 ./result/bin/learn-nix.exe'

