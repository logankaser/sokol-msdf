#include <stdio.h>

#include <absl/flags/flag.h>
#include <absl/flags/parse.h>
#include <msdf-atlas-gen.h>

ABSL_FLAG(std::string, font, "", "Font to generate from");

int main(int argc, char** argv) {
  absl::ParseCommandLine(argc, argv);
  msdfgen::FreetypeHandle* ft = msdfgen::initializeFreetype();
  msdfgen::FontHandle* font = msdfgen::loadFont(ft, absl::GetFlag(FLAGS_font).data());
  printf("font: %p\n", font);
  return 0;
}
