. $(dirname $0)/helper.sh

test_bz2() {
  assertWorksWithTarball $SAMPLES/foo-1.0.tar.bz2
}

test_gz() {
  assertWorksWithTarball $SAMPLES/foo-1.0.tar.gz
}

test_xz() {
  assertWorksWithTarball $SAMPLES/foo-1.0.tar.xz
}

. shunit2
