#!/usr/bin/env bash

echo "Pushing ALL new-format tags to origin"
read -p "Are you sure? [y/N]: " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

git push origin \
    refs/tags/v1.2.3 \
    refs/tags/v1.2.2 \
    refs/tags/v1.2.1.1 \
    refs/tags/v1.2.1 \
    refs/tags/v1.2.0 \
    refs/tags/v1.1.10 \
    refs/tags/v1.1.9 \
    refs/tags/v1.1.8 \
    refs/tags/v1.1.7 \
    refs/tags/v1.1.6 \
    refs/tags/v1.1.5 \
    refs/tags/v1.1.4 \
    refs/tags/v1.1.3 \
    refs/tags/v1.1.2 \
    refs/tags/v1.1.1 \
    refs/tags/v1.1.0 \
    refs/tags/v1.0.9 \
    refs/tags/v1.0.8 \
    refs/tags/v1.0.7 \
    refs/tags/v1.0.6 \
    refs/tags/v1.0.5 \
    refs/tags/v1.0.4 \
    refs/tags/v1.0.3 \
    refs/tags/v1.0.2 \
    refs/tags/v1.0.1 \
    refs/tags/v1.0.0 \
    refs/tags/v0.4.9 \
    refs/tags/v0.4.8 \
    refs/tags/v0.4.7 \
    refs/tags/v0.4.6 \
    refs/tags/v0.4.5 \
    refs/tags/v0.4.4.1 \
    refs/tags/v0.4.4 \
    refs/tags/v0.4.3 \
    refs/tags/v0.4.2 \
    refs/tags/v0.4.1 \
    refs/tags/v0.4.0 \
    refs/tags/v0.3.5 \
    refs/tags/v0.3.4 \
    refs/tags/v0.3.3 \
    refs/tags/v0.3.2 \
    refs/tags/v0.3.1 \
    refs/tags/v0.3 \
    refs/tags/v0.2.5 \
    refs/tags/v0.2.4 \
    refs/tags/v0.2.3 \
    refs/tags/v0.2.2

