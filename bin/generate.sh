#!/bin/bash -eu

bold=$(tput bold)
normal=$(tput sgr0)

echo; echo "${bold}Generates site contents...${normal}"

# Clean up the existing contents other than feeds and repository data.
find public -not -name .git\* -a -not -name \*xml -delete

# Generate the contents.
hugo --disableKinds=RSS

# Beautifying the HTML files.
find public -name \*html -print0 \
  | xargs -0 "$(npm bin)/html-beautify" \
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
