#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="$HOME/.local/bin"
SRC_DIR="$HOME/.local/src"
mkdir -p "$INSTALL_DIR" "$SRC_DIR"

OS="$(uname -s)"

#
# fpc + lazarus
#
if [ "$OS" = "Darwin" ]; then
  brew install fpc
  # note: lazarus cask deprecated in homebrew — may fail
  # fallback: https://www.lazarus-ide.org/index.php?page=downloads
  brew install --cask lazarus || true
elif [ "$OS" = "Linux" ]; then
  sudo apt-get install -y fp-compiler lazarus
fi

#
# pasls (pascal-language-server)
# https://github.com/genericptr/pascal-language-server
#
PASLS_SRC="$SRC_DIR/pascal-language-server"
[ -d "$PASLS_SRC" ] || git clone https://github.com/genericptr/pascal-language-server "$PASLS_SRC"
cd "$PASLS_SRC"

# fix for lazarus != 3.0: rename LAZ_AVL_Tree to AVL_Tree
if [ "$OS" = "Darwin" ]; then
  sed -i '' 's/LAZ_AVL_Tree/AVL_Tree/g' src/references/PasLS.References.pas 2>/dev/null || true
else
  sed -i 's/LAZ_AVL_Tree/AVL_Tree/g' src/references/PasLS.References.pas 2>/dev/null || true
fi

lazbuild src/protocol/lspprotocol.lpk
lazbuild src/serverprotocol/lspserver.lpk
lazbuild src/standard/pasls.lpi
cp src/standard/pasls "$INSTALL_DIR/pasls"

#
# jcf (Jedi Code Formatter)
# https://github.com/jedicodeformat/jcf-ide
#
JCF_SRC="$SRC_DIR/jcf-ide"
[ -d "$JCF_SRC" ] || git clone https://github.com/jedicodeformat/jcf-ide "$JCF_SRC"
cd "$JCF_SRC/commandline"
fpc JCF.pas
cp JCF "$INSTALL_DIR/jcf"
