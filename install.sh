#!/bin/sh

cd `dirname $0`

sh -c "$(curl -fsLS chezmoi.io/get)" -- init --apply -b $HOME/.local/bin -S .
