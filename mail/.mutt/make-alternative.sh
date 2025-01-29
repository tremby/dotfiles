#!/usr/bin/env bash

# Juice is https://www.npmjs.com/package/juice
# So expects to be installed via `sudo npm i -g juice`

juice <(pandoc --standalone --template=$HOME/.mutt/template.html --from=commonmark --to=html) /tmp/neomutt-alternative.html
