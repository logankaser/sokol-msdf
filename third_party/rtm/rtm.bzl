load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def rtm_workspace():
    http_archive(
        name = "rtm",
        build_file = "//third_party/rtm:BUILD.bazel",
        urls = ["https://github.com/nfrechette/rtm/archive/refs/tags/v2.1.5.tar.gz"],
        sha256 = "afb05cb00b59498756ca197028de291a1960e58d5f6fcad161d8240682481eae",
        strip_prefix = "rtm-2.1.5",
    )
