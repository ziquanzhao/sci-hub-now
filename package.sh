version=$(gsed -n 's/^.*"version": "\(.*\)",/\1/p' manifest.json)
echo "Version: $version"
fname="web-ext-artifacts/sci-hub_x_now_-${version}.zip"
echo "zipping archive for chrome: $fname"
git archive -v --worktree-attributes -o $fname HEAD

# This zip archive can be used for chrome and edge.
# Theoretically, `web-ext sign` should sign it for firefox, but it's really slow and only
# lets you do it once so it's easier to just manually upload it to the firefox store and
# download the .xpi artifact from there.

# web-ext build -i data icons/outline.sh package.sh
# web-ext sign