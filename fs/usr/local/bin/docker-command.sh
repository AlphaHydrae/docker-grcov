#!/usr/bin/env bash
set -e

cd /usr/src/app
cargo test

if [[ "$GRCOV_HTML_DIR" != "false" ]]; then
  grcov . -s . --binary-path ./target/debug/ -t html --branch --ignore-not-existing -o "$GRCOV_HTML_DIR"
fi

if [[ "$GRCOV_LCOV_FILE" != "false" ]]; then
  grcov . -s . --binary-path ./target/debug/ -t lcov --branch --ignore-not-existing -o "$GRCOV_LCOV_FILE"
fi

rm -f ./target/debug/*.profraw
