#!/bin/sh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CMD_DIR="${SCRIPT_DIR}/../cmd"

chmod -R +x $CMD_DIR

# シェル設定ファイルを決める（SHELL変数版）
if echo "$SHELL" | grep -q "zsh"; then
    SHELL_RC="$HOME/.zshrc"
elif echo "$SHELL" | grep -q "bash"; then
    SHELL_RC="$HOME/.bashrc"
else
    SHELL_RC="$HOME/.profile"
fi

if grep -q "$CMD_DIR" "$SHELL_RC"; then
    echo "PATH already includes $CMD_DIR in $SHELL_RC"
else
    echo "Adding $CMD_DIR to PATH in $SHELL_RC"
    echo "" >> "$SHELL_RC"
    echo "# Added by setup.sh" >> "$SHELL_RC"
    echo "export PATH=\"$(realpath "$CMD_DIR"):\$PATH\"" >> "$SHELL_RC"
fi

echo "✅ Done."
echo "Please reload your shell config: source $SHELL_RC"
