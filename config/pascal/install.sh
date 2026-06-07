#!/usr/bin/env bash
set -euo pipefail

INSTALL_DIR="$HOME/.local/bin"
SRC_DIR="$HOME/.local/src"
LAZARUS_DIR="/Applications/lazarus"
# 4.4 ships with FPC 3.2.2 — matches brew fpc; 4.6 requires FPC 3.2.4 (incompatible)
LAZARUS_VERSION="4.4"
mkdir -p "$INSTALL_DIR" "$SRC_DIR"

OS="$(uname -s)"
ARCH="$(uname -m)"

#
# fpc + lazarus
#
if [ "$OS" = "Darwin" ]; then
  brew install fpc

  # lazarus — download from official site (brew cask deprecated)
  # https://www.lazarus-ide.org/index.php?page=downloads
  if [ "$ARCH" = "arm64" ]; then
    LAZARUS_ZIP="lazarus-darwin-aarch64-${LAZARUS_VERSION}.zip"
    LAZARUS_URL="https://sourceforge.net/projects/lazarus/files/Lazarus%20macOS%20aarch64/Lazarus%20${LAZARUS_VERSION}/${LAZARUS_ZIP}/download"
  else
    LAZARUS_ZIP="lazarus-darwin-x86_64-${LAZARUS_VERSION}.zip"
    LAZARUS_URL="https://sourceforge.net/projects/lazarus/files/Lazarus%20macOS%20x86-64/Lazarus%20${LAZARUS_VERSION}/${LAZARUS_ZIP}/download"
  fi

  curl -L -o "/tmp/${LAZARUS_ZIP}" "${LAZARUS_URL}"
  xattr -cr "/tmp/${LAZARUS_ZIP}"
  rm -rf "${LAZARUS_DIR}"
  unzip -q "/tmp/${LAZARUS_ZIP}" -d /Applications/
  ln -sf "${LAZARUS_DIR}/lazbuild" "$INSTALL_DIR/lazbuild"

elif [ "$OS" = "Linux" ]; then
  sudo apt-get install -y fp-compiler lazarus
fi

LAZBUILD_FLAGS=""
if [ "$OS" = "Darwin" ]; then
  LAZBUILD_FLAGS="--lazarusdir=${LAZARUS_DIR} --pcp=${LAZARUS_DIR}/config"
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

lazbuild $LAZBUILD_FLAGS src/protocol/lspprotocol.lpk
lazbuild $LAZBUILD_FLAGS src/serverprotocol/lspserver.lpk
lazbuild $LAZBUILD_FLAGS src/standard/pasls.lpi
cp src/standard/pasls "$INSTALL_DIR/pasls"

#
# jcf (Jedi Code Formatter)
# https://github.com/git-bee/jcf-cli
# note: plain fpc compile fails on macOS ARM64 (Carbon GetKeys link error) — use lazbuild
#
JCF_SRC="$SRC_DIR/jcf-cli"
[ -d "$JCF_SRC" ] || git clone https://github.com/git-bee/jcf-cli "$JCF_SRC"
JCF_CPU="${ARCH}"
[ "$ARCH" = "arm64" ] && JCF_CPU="aarch64"
rm -rf "$JCF_SRC/Output"
lazbuild $LAZBUILD_FLAGS --cpu="${JCF_CPU}" \
  "$JCF_SRC/CommandLine/Lazarus/jcf.lpi"
cp "$JCF_SRC/Output/Lazarus/JCF" "$INSTALL_DIR/jcf"
