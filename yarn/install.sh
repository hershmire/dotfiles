#!/bin/sh

# Yarn is managed by Corepack (bundled with Node.js), not asdf.
# Projects declare their yarn version via "packageManager" in package.json.

# Remove legacy asdf yarn plugin if still present
if [[ -n "$(asdf plugin list 2>/dev/null | grep yarn)" ]]; then
  echo "Removing asdf yarn plugin (yarn is now managed by Corepack)..."
  asdf plugin remove yarn
fi

# Ensure Corepack is enabled for the current Node.js
if command -v corepack &> /dev/null; then
  corepack enable
  echo "Corepack enabled — yarn will be resolved per-project via packageManager field."
else
  echo "Warning: corepack not found. Install Node.js 16.9+ to get Corepack."
fi
