#!/bin/sh
# Publish the HarperLinks marketing site to Cloudflare Pages.
#
# The site is plain static files, so there is no build step — this uploads
# the folder as-is. _headers is read by Cloudflare Pages natively, so the
# security headers and the asset cache rule carry over unchanged.
#
# First time only:  npx wrangler login     (opens your browser)
# Every time after: ./deploy.sh
#
set -e
cd "$(dirname "$0")"

PROJECT="${CF_PAGES_PROJECT:-harperlinks}"

echo "Publishing to Cloudflare Pages project: $PROJECT"
npx wrangler pages deploy . \
  --project-name "$PROJECT" \
  --branch main \
  --commit-dirty=true

echo
echo "Done. Check it at https://$PROJECT.pages.dev before pointing the domain over."
