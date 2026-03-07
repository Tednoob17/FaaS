#!/bin/bash
# Quick rebuild and start with fresh seeded routes

echo "=== FaaS Fresh Start ==="
echo ""

echo "[1/5] Stopping any running services..."
make stop 2>/dev/null

echo ""
echo "[2/5] Cleaning build artifacts..."
make clean

echo ""
echo "[3/5] Rebuilding binaries..."
make

echo ""
echo "[4/5] Reseeding database with local demo routes..."
make init

echo ""
echo "[5/5] Starting services..."
echo ""
make start
