#include <stdio.h>

#include <absl/flags/flag.h>
#include <absl/flags/parse.h>
#include <msdf-atlas-gen.h>

ABSL_FLAG(bool, test, false, "enable test");

int main(int argc, char** argv) {
  absl::ParseCommandLine(argc, argv);
  printf("Yeeeee: %i\n", absl::GetFlag(FLAGS_test));
  return 0;
}