 Prepare artifacts for a release pipeline - Bash Scripting

## Create a script to:
-   Package application code into a versioned `tarball`.
-   Exclude directories like `node_modules` or `.git`.
-   Validate required files exist before packaging.
-   Generate a checksum file for integrity verification.
-   Print the package path on success.

>Expected skills: tar, exclusion patterns, validation, output formatting.

## Step 1: Creating Sample project
```bash
mkdir src
touch package.json
touch README.md
```

```bash
echo "console.log('hello world');" > src/app.js
echo "Sample project for release pipeline" > README.md
```

## Step 2: Create the release_package.sh script

```bash
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
```

## Step 3: Make the script executable
```bash
chmod +x release_package.sh
```

## Step 4: Run the script
```bash
./release_package.sh
```

## Step 4: Package creation
```bash
==============================
  PACKAGE SUCCESSFULLY BUILT
==============================
Package: ./release_packages/myapp-2025.11.26-1557.tar.gz
Checksum: ./release_packages/myapp-2025.11.26-1557.tar.gz.sha256
```
## Step 5: Checking integrity
```bash
sha256sum -c release_packages/myapp-2025.11.26-1557.tar.gz.sha256
./release_packages/myapp-2025.11.26-1557.tar.gz: OK
```

