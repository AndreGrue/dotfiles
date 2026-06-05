#!/usr/bin/env bash

# npm install -g @github/copilot
npm install -g opencode-ai

# https://github.com/modelcontextprotocol/servers
npm install -g @modelcontextprotocol/server-filesystem
npm install -g @modelcontextprotocol/server-sequential-thinking
npm install -g @modelcontextprotocol/server-memory
# not needed if using uv
# pip3 install mcp-server-fetch
# pip3 install mcp-server-git

# https://github.com/bx33661/Wireshark-MCP
pip install wireshark-mcp

#
# skills
npx skills add JuliusBrussee/caveman -a github-copilot
npx skills add https://github.com/multica-ai/andrej-karpathy-skills --skill karpathy-guidelines
