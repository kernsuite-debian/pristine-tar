. $(dirname $0)/helper.sh

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
