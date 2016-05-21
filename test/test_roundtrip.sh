. $(dirname $0)/helper.sh

assertWorksWithTarball() {
  local orig_tarball="$1"
  local tarball=$(basename "$orig_tarball")
  local dir=$(echo "$tarball" | cut -d - -f 1)

  git_init "$dir"

  import_tarball "$orig_tarball"

  pristine-tar commit "$orig_tarball"
  pristine-tar checkout "$tarball"

  assertHashEquals "$orig_tarball" "$tarball"
}

test_bz2() {
  assertWorksWithTarball $SAMPLES/tarballs/foo-1.0.tar.bz2
}

test_gz() {
  assertWorksWithTarball $SAMPLES/tarballs/foo-1.0.tar.gz
}

test_xz() {
  assertWorksWithTarball $SAMPLES/tarballs/foo-1.0.tar.xz
}

. shunit2
