load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def sokol_workspace():
    http_archive(
        name = "sokol",
        build_file = "//third_party/sokol:BUILD.bazel",
        urls = ["https://github.com/floooh/sokol/archive/7f2b86f5bb7145b1d6b2b8d81c81b8356475c1e7/sokol-7f2b86f5bb7145b1d6b2b8d81c81b8356475c1e7.tar.gz"],
        sha256 = "f6e75e116add1c1508942a8bc00fe3b4cbeaa480b011a5bf06131770de8d82f1",
        strip_prefix = "sokol-7f2b86f5bb7145b1d6b2b8d81c81b8356475c1e7",
    )
