#!/bin/bash

TARGET_DIR="$1"

# 1. Ellenőrzés: kaptunk-e mappanevet?
if [ -z "$TARGET_DIR" ]; then
  echo "Error: No directory provided"
  exit 1
fi

# 2. .txt fájlok biztonságossá tétele (644)
find "$TARGET_DIR" -name '*.txt' -exec chmod 644 {} \;

# 3. .sh fájlok védelme (700)
find "$TARGET_DIR" -name '*.sh' -exec chmod 700 {} \;

# 4. Naplózás az audit.log fájlba
echo "Fix applied to $TARGET_DIR at $(date)" >> audit.log
