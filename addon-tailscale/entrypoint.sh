#!/bin/sh
echo "chmod start..."
chmod +x /config/tailscale/start.sh
echo "run start.sh.."
sh /config/tailscale/start.sh
#cloudflared update
#echo "Starting Tailscale tunnel..."
#exec "$@"