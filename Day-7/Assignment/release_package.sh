#!/bin/bash


# Exit immediately on failure
set -e

# ----- CONFIG -----
APP_NAME="myapp"
VERSION=$(date +"%Y.%m.%d-%H%M")   # auto version (e.g., 2025.11.26-2130)
OUTPUT_DIR="./release_packages"
TARBALL="$OUTPUT_DIR/${APP_NAME}-${VERSION}.tar.gz"
CHECKSUM_FILE="$TARBALL.sha256"

# Paths to validate before packaging
REQUIRED_FILES=("package.json" "README.md" "src")

# Directories to exclude
EXCLUDES=(
  "--exclude=node_modules"
  "--exclude=.git"
  "--exclude=release_packages"
)

# ------------------------------


# 1. Validate Required Files
echo "Validating required files..."
for file in "${REQUIRED_FILES[@]}"; do
    if [[ ! -e "$file" ]]; then
        echo "Error: Required file or directory '$file' not found!"
        exit 1
    fi
done
echo "Validation successful"


# 2. Create Output Directory
mkdir -p "$OUTPUT_DIR"


# 3. Package Code into Tarball
echo "Creating tarball package..."
tar -czf "$TARBALL" "${EXCLUDES[@]}" ./*
echo "Package created: $TARBALL"


# 4. Generate Checksum
echo "Generating checksum..."
sha256sum "$TARBALL" > "$CHECKSUM_FILE"
echo "Checksum generated: $CHECKSUM_FILE"


# 5. Final Output
echo ""
echo "=============================="
echo "  PACKAGE SUCCESSFULLY BUILT"
echo "=============================="
echo "Package: $TARBALL"
echo "Checksum: $CHECKSUM_FILE"
echo ""

