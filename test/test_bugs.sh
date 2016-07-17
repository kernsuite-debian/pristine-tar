. $(dirname $0)/helper.sh

test_700448() {
  # pristine-tar list should work with empty repo
  git_init pkg  
  assertSuccess pristine-tar list
}

. shunit2
