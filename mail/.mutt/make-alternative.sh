#!/usr/bin/env bash

juice <(pandoc --standalone --template=$HOME/.mutt/template.html --from=commonmark --to=html) /tmp/neomutt-alternative.html
