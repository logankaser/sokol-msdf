load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def msdf_atlas_gen_workspace():
    http_archive(
        name = "msdf_atlas_gen",
        urls = ["https://github.com/logankaser/msdf-atlas-gen/archive/refs/tags/v0.1.0.tar.gz"],
        sha256 = "96fdae430a529b0b5ab5d0d02eff6446c44ff003c9f9309cacf1919c7c2fb929",
        strip_prefix = "msdf-atlas-gen-0.1.0",
    )
