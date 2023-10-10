#!/usr/bin/env sh

# Install language servers for python
pip install -U 'python-lsp-server[all]'
pip install python-lsp-ruff
pip install sqlfluff
