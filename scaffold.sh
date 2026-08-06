#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 --target <dir> [--with-tenant]"
  echo ""
  echo "Copies the skeleton into the target directory."
  echo ""
  echo "  --target       Destination directory (e.g., ./automation)"
  echo "  --with-tenant  Also copy bootstrap-tenant (default: infra only)"
  exit 1
}

TARGET=""
WITH_TENANT=false

while [[ $# -gt 0 ]]; do
  case $1 in
    --target) TARGET="$2"; shift 2 ;;
    --with-tenant) WITH_TENANT=true; shift ;;
    *) usage ;;
  esac
done

[[ -z "$TARGET" ]] && usage

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKELETON="$SCRIPT_DIR/skeleton"

if [[ ! -d "$SKELETON/bootstrap-infra" ]]; then
  echo "Error: skeleton not found at $SKELETON" >&2
  exit 1
fi

if [[ -d "$TARGET/bootstrap-infra" ]]; then
  echo "Error: $TARGET/bootstrap-infra already exists. Remove it first to re-scaffold." >&2
  exit 1
fi

mkdir -p "$TARGET"
cp -R "$SKELETON/bootstrap-infra" "$TARGET/bootstrap-infra"
echo "Copied bootstrap-infra to $TARGET/bootstrap-infra"

if [[ "$WITH_TENANT" == true ]]; then
  if [[ -d "$TARGET/bootstrap-tenant" ]]; then
    echo "Error: $TARGET/bootstrap-tenant already exists. Remove it first to re-scaffold." >&2
    exit 1
  fi
  cp -R "$SKELETON/bootstrap-tenant" "$TARGET/bootstrap-tenant"
  echo "Copied bootstrap-tenant to $TARGET/bootstrap-tenant"
fi
