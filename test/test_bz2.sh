. $(dirname $0)/helper.sh

test_basics() {
  assertWorksWithTarball $SAMPLES/foo-1.0.tar.bz2
}

. shunit2
