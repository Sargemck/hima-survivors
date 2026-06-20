# Hima Survivors

A small browser game in the vein of *Vampire Survivors*: you control a dog,
enemies swarm in, and you survive as long as you can while weapons fire
automatically. It's a single self-contained `index.html` — vanilla JavaScript
rendered on a Canvas 2D context, with the artwork embedded directly in the file
as a base64 PNG. No build step, no frameworks, no external dependencies.

## Run locally

The game is a static file, but it should be served over HTTP (opening the file
directly with `file://` can break some browser features). From the repo root:

```sh
python3 -m http.server 8000
```

Then open <http://localhost:8000> in your browser.

## Check

`check.sh` extracts the embedded `<script>` block from `index.html` and runs
`node --check` on it to catch JavaScript syntax errors:

```sh
./check.sh
```

It exits nonzero if the script block fails to parse.

## Deploy (Cloudflare Pages)

This repo deploys as-is — there is nothing to build. In the Cloudflare Pages
project settings:

- **Framework preset:** None
- **Build command:** *(empty)*
- **Build output directory:** `/` (the repo root)

Cloudflare serves `index.html` at the site root, and pushes to `main` trigger
automatic deploys.
