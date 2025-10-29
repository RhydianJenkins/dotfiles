#!/usr/bin/env bash
# Test runner script for Nix configuration tests

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "================================"
echo "Running Nix Configuration Tests"
echo "================================"
echo ""

# Run Python tests
if command -v python3 &> /dev/null; then
    echo "Running Python unit tests..."
    python3 -m unittest discover -s . -p "test_*.py" -v
    echo ""
    echo "✅ All tests passed!"
else
    echo "❌ Error: python3 not found"
    exit 1
fi

echo ""
echo "================================"
echo "Test suite completed successfully"
echo "================================"