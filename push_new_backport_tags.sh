#!/usr/bin/env bash

echo "Pushing ALL new-format backport tags to origin"
read -p "Are you sure? [y/N]: " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

git push origin \
    refs/tags/v1.2.3+mc1.20.4 \
    refs/tags/v1.2.3+mc1.19.4 \
    refs/tags/v1.2.3+mc1.19.2 \
    refs/tags/v1.2.3+mc1.18.2 \
    refs/tags/v1.2.3+mc1.17.1 \
    refs/tags/v1.2.3+mc1.16.5 \
    refs/tags/v1.2.2+mc1.20.4 \
    refs/tags/v1.2.1.1+mc1.20.2 \
    refs/tags/v1.2.1+mc1.20.2 \
    refs/tags/v1.2.1+mc1.20.1 \
    refs/tags/v1.2.1+mc1.19.4 \
    refs/tags/v1.2.1+mc1.18.2 \
    refs/tags/v1.2.1+mc1.17.1 \
    refs/tags/v1.2.1+mc1.16.5 \
    refs/tags/v1.2.0+mc1.20.1 \
    refs/tags/v1.2.0+mc1.19.4 \
    refs/tags/v1.2.0+mc1.18.2 \
    refs/tags/v1.2.0+mc1.17.1 \
    refs/tags/v1.2.0+mc1.16.5

echo "Done"

