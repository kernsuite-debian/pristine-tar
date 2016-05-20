CURDIR=$(pwd)
SAMPLES=$(readlink -f $(dirname $0))/samples

setUp() {
  TMPDIR=$(mktemp -d)
  cd "$TMPDIR"
}

tearDown() {
  cd "$CURDIR"
  rm -rf "$TMPDIR"
}

get_sha1() {
  sha1sum "$@" | awk '{print($1)}'
}

git_init() {
  local repo="$1"
  mkdir "$repo"
  cd "$repo"
  git init
}

import_tarball() {
  local tarball="$1"
  tar --strip-components=1 -xaf "$tarball"
  git add .
  git commit -m 'Initial commit'
  git branch upstream
}

assertWorksWithTarball() {
  local orig_tarball="$1"
  local tarball=$(basename "$orig_tarball")
  local dir=$(echo "$tarball" | cut -d - -f 1)

  git_init "$dir"

  import_tarball "$orig_tarball"

  pristine-tar commit "$orig_tarball"
  orig_sha1=$(get_sha1 "$orig_tarball")

  pristine-tar checkout "$tarball"
  sha1=$(get_sha1 "$tarball")

  assertEquals "$orig_sha1" "$sha1"
}
