#!/bin/bash -eu

echo -e "\033[0;32Generates site contents...\033[0m"

# Clean up the existing contents.
find public -not -name .git\* -delete

# Generate the contents.
hugo

# Beautifying the HTML files.
find public -name \*html -print0 \
  | xargs -0 $(npm bin)/html-beautify \
          --editorconfig \
          --indent-inner-html=true \
          --indent-size=2 \
          --replace \
          --type=html \
          --unformatted=script \
          --unformatted=style

msg="Rebuilding site $(date)"
if [ $# -eq 1 ]; then
  msg="$1"
fi

(
  cd public
  git add -A
  git commit -m "$msg"
)
git add public
git commit -m "$msg"
