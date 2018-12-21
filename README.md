An example of using Haskell with Nix

This repository mostly exists as a minimum viable example for myself to refer to
when I forget how things work.

```
# install nix, if you don't already have it
$ curl https://nixos.org/nix/install | sh

# install cabal, if you don't already have it
$ nix-env --install cabal-install
```

now we are good to go!

we can `nix-shell` to fire up a shell with the appropriate dependencies


We then need to create a cabal file, from our hpack

`buildCabal`

No we can just run
`nix-build project.nix`
to build it. nice,


using nix build is bad though - because it can't cache work as smartly as cabal
itself


we can bring up another nix shell with everything we need to build with cabal by
running

`nix-shell --attr env project.nix`

then run
`cabal configure`
`cabal run example`

wow. tasty


