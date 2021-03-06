let pkgsrc = builtins.fetchTarball
    {
        url = "https://github.com/NixOS/nixpkgs/archive/7b38b03d76ab71bdc8dc325e3f6338d984cc35ca.tar.gz";
        sha256 = "0g880gbkxf9n80pkz2nkf177naxf6n95qkca1ca7m9nk32gvki0f";
    };
    pkgs = import pkgsrc {};
    hspkgs = (pkgs.haskell.packages.ghc8107.override
    {
        overrides = self: super:
        {
            mkDerivation = args: super.mkDerivation (args //
            {
                enableLibraryProfiling = true;
                enableExecutableProfiling = true;
            });
            ghc = super.ghc.override
            {
                enableProfiledLibs = true;
            };
        };
    }).ghcWithPackages (p: [p.base]);
in pkgs.mkShell
{
    packages = [ hspkgs
                 pkgs.haskell.packages.ghc8107.cabal-install
               ];
}
