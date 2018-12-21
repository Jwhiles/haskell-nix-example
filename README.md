Just playing around with haskell and nix

you need nix

then u need cabal :(

then run nix-shell

hpack && cabal2nix . > hask.nix

to build up a fun little haskelly nixy thing

then nix-build project.nix to build it! woo


using nix build is bad though - because it can't cache work as smartly as cabal
itself

we can bring up another nix shell with everything we need to build with cabal by
running

`nix-shell --attr env release0.nix`

then run
`cabal configure`
`cabal run example`


wow.


