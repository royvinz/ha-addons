#!/bin/sh
#echo "Updating Cloudflared..."
tailscale up
#cloudflared update
echo "Starting Tailscale tunnel..."
exec "$@"