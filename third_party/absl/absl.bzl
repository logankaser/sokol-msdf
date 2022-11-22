load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def absl_workspace():
    http_archive(
        name = "com_google_absl",
        urls = ["https://github.com/abseil/abseil-cpp/archive/refs/tags/20220623.1.tar.gz"],
        #build_file_content = "package(default_visibility = [\"//visibility:public\"])",
        sha256 = "91ac87d30cc6d79f9ab974c51874a704de9c2647c40f6932597329a282217ba8",
        strip_prefix = "abseil-cpp-20220623.1",
        patch_args = [
            "-p1",
        ],
        patch_tool = "patch",
        patches = [
            "//third_party/absl:patches/no-non-virtual-dtor.patch",
            "//third_party/absl:patches/enable-angle-brackets.patch",
        ],
    )