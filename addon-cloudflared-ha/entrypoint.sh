#!/bin/sh
echo "Updating Cloudflared..."
cloudflared update
echo "Starting Cloudflared tunnel..."
exec "$@"