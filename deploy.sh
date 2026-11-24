#!/bin/sh
# Publish the HarperLinks marketing site to Cloudflare.
#
# The site is plain static files, so there is no build step — this uploads
# the folder as-is. _headers is read natively, so the security headers and
# the immutable asset cache carry over unchanged. .assetsignore keeps .git
# and friends out of the upload.
#
# First time only:  npx wrangler login     (opens your browser)
# Every time after: ./deploy.sh
#
set -e
cd "$(dirname "$0")"

npx wrangler deploy

echo
echo "Live at https://harperlinks.harperlinks-website.workers.dev"
