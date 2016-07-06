. $(dirname $0)/helper.sh

test_verify_intact_tarball() {
  local orig_tarball=$SAMPLES/tarballs/foo-1.0.tar.gz
  local tarball=$(basename "$orig_tarball")

  git_init pkg
  import_tarball "$orig_tarball"
  pristine-tar commit "$orig_tarball"

  assertTrue "pristine-tar verify $orig_tarball"
}

test_verify_corrupt_tarball() {
  local orig_tarball=$SAMPLES/tarballs/foo-1.0.tar.gz
  local tarball=$(basename "$orig_tarball")

  git_init pkg
  import_tarball "$orig_tarball"
  pristine-tar commit "$orig_tarball"

  date > "$tarball" # "corrupted" tarball
  assertFalse "pristine-tar verify $tarball"
}

. shunit2
