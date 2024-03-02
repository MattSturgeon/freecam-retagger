#!/usr/bin/env bash

echo "Updating GitHub release tags"
echo "This may take over a minute"
read -p "Are you sure? [y/N]: " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

echo "1.2.x"
echo "  - v1.2.3" && gh release edit 1.2.3 --tag=v1.2.3 --verify-tag && sleep 1s
echo "  - v1.2.2" && gh release edit 1.2.2-mc1.20 --tag=v1.2.2 --verify-tag && sleep 1s
echo "  - v1.2.1.1" && gh release edit 1.2.1.1-mc1.20 --tag=v1.2.1.1 --verify-tag && sleep 1s
echo "  - v1.2.1" && gh release edit 1.2.1-mc1.20 --tag=v1.2.1 --verify-tag && sleep 1s
echo "  - v1.2.0" && gh release edit 1.2.0-mc1.20 --tag=v1.2.0 --verify-tag && sleep 1s
echo "1.1.x"
echo "  - v1.1.10" && gh release edit 1.1.10-mc1.20 --tag=v1.1.10 --verify-tag && sleep 1s
echo "  - v1.1.9" && gh release edit 1.1.9-mc1.19 --tag=v1.1.9 --verify-tag && sleep 1s
echo "  - v1.1.8" && gh release edit 1.1.8-mc1.19 --tag=v1.1.8 --verify-tag && sleep 1s
echo "  - v1.1.7" && gh release edit 1.1.7-mc1.19 --tag=v1.1.7 --verify-tag && sleep 1s
echo "  - v1.1.6" && gh release edit 1.1.6-mc1.19 --tag=v1.1.6 --verify-tag && sleep 1s
echo "  - v1.1.5" && gh release edit 1.1.5-mc1.19 --tag=v1.1.5 --verify-tag && sleep 1s
echo "  - v1.1.4" && gh release edit 1.1.4-mc1.19 --tag=v1.1.4 --verify-tag && sleep 1s
echo "  - v1.1.3" && gh release edit 1.1.3-mc1.19 --tag=v1.1.3 --verify-tag && sleep 1s
echo "  - v1.1.2" && gh release edit 1.1.2-mc1.19 --tag=v1.1.2 --verify-tag && sleep 1s
echo "  - v1.1.1" && gh release edit 1.1.1-mc1.19 --tag=v1.1.1 --verify-tag && sleep 1s
echo "  - v1.1.0" && gh release edit 1.1.0-mc1.19 --tag=v1.1.0 --verify-tag && sleep 1s
echo "1.0.x"
echo "  - v1.0.9" && gh release edit 1.0.9-mc1.19 --tag=v1.0.9 --verify-tag && sleep 1s
echo "  - v1.0.8" && gh release edit 1.0.8-mc1.19 --tag=v1.0.8 --verify-tag && sleep 1s
echo "  - v1.0.7" && gh release edit 1.0.7-mc1.19 --tag=v1.0.7 --verify-tag && sleep 1s
echo "  - v1.0.6" && gh release edit 1.0.6-mc1.19 --tag=v1.0.6 --verify-tag && sleep 1s
echo "  - v1.0.5" && gh release edit 1.0.5-mc1.18 --tag=v1.0.5 --verify-tag && sleep 1s
echo "  - v1.0.4" && gh release edit 1.0.4-mc1.18 --tag=v1.0.4 --verify-tag && sleep 1s
echo "  - v1.0.3" && gh release edit 1.0.3-mc1.18 --tag=v1.0.3 --verify-tag && sleep 1s
echo "  - v1.0.2" && gh release edit 1.0.2-mc1.18 --tag=v1.0.2 --verify-tag && sleep 1s
echo "  - v1.0.1" && gh release edit 1.0.1-mc1.18 --tag=v1.0.1 --verify-tag && sleep 1s
echo "  - v1.0.0" && gh release edit 1.0.0-mc1.18 --tag=v1.0.0 --verify-tag && sleep 1s
echo "0.4.x"
echo "  - v0.4.9" && gh release edit 0.4.9-mc1.18 --tag=v0.4.9 --verify-tag && sleep 1s
echo "  - v0.4.8" && gh release edit 0.4.8-mc1.18 --tag=v0.4.8 --verify-tag && sleep 1s
echo "  - v0.4.7" && gh release edit 0.4.7-mc1.18 --tag=v0.4.7 --verify-tag && sleep 1s
echo "  - v0.4.6" && gh release edit 0.4.6-mc1.18 --tag=v0.4.6 --verify-tag && sleep 1s
echo "  - v0.4.5" && gh release edit 0.4.5-mc1.18 --tag=v0.4.5 --verify-tag && sleep 1s
echo "  - v0.4.4.1" && gh release edit 0.4.4.1-mc1.17 --tag=v0.4.4.1 --verify-tag && sleep 1s
echo "  - v0.4.4" && gh release edit 0.4.4-mc1.18 --tag=v0.4.4 --verify-tag && sleep 1s
echo "  - v0.4.3" && gh release edit 0.4.3-mc1.18 --tag=v0.4.3 --verify-tag && sleep 1s
echo "  - v0.4.2" && gh release edit 0.4.2-mc1.18 --tag=v0.4.2 --verify-tag && sleep 1s
echo "  - v0.4.1" && gh release edit 0.4.1-mc1.18 --tag=v0.4.1 --verify-tag && sleep 1s
echo "  - v0.4.0" && gh release edit 0.4.0-mc1.18 --tag=v0.4.0 --verify-tag && sleep 1s
echo "0.3.x"
echo "  - v0.3.5" && gh release edit 0.3.5-mc1.18 --tag=v0.3.5 --verify-tag && sleep 1s
echo "  - v0.3.4" && gh release edit 0.3.4-mc1.18 --tag=v0.3.4 --verify-tag && sleep 1s
echo "  - v0.3.3" && gh release edit 0.3.3-mc1.18.1 --tag=v0.3.3 --verify-tag && sleep 1s
echo "  - v0.3.2" && gh release edit 0.3.2-mc1.18.1 --tag=v0.3.2 --verify-tag && sleep 1s
echo "  - v0.3.1" && gh release edit 0.3.1-mc1.18.1 --tag=v0.3.1 --verify-tag && sleep 1s
echo "  - v0.3" && gh release edit 0.3-mc1.18.1 --tag=v0.3 --verify-tag && sleep 1s
echo "0.2.x"
echo "  - v0.2.5" && gh release edit 0.2.5-mc1.18.1 --tag=v0.2.5 --verify-tag && sleep 1s
echo "  - v0.2.4" && gh release edit 0.2.4-mc1.18.1 --tag=v0.2.4 --verify-tag && sleep 1s
echo "  - v0.2.3" && gh release edit 0.2.3-mc1.18.1 --tag=v0.2.3 --verify-tag && sleep 1s
echo "  - v0.2.2" && gh release edit 0.2.2-mc1.18.1 --tag=v0.2.2 --verify-tag && sleep 1s
echo "Done"
