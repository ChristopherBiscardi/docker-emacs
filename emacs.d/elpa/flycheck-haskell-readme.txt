Automatically configure Flycheck for Haskell.

Cabal support

Try to find a Cabal file for the current Haskell buffer, and configure syntax
checking according to the Cabal project settings.

Cabal sandboxes

Try to find a Cabal sandbox configuration for this project, and configure the
Haskell syntax checkers in Flycheck to use the package database from the
Sandbox.

Setup

(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)
