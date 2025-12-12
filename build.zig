const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const mod = b.addModule("sokol", .{
        .target = target,
        .optimize = optimize,
        .link_libc = true,
        .pic = true,
    });

    const lib = b.addLibrary(.{
        .root_module = mod,
        .linkage = .static,
        .name = "sokol",
    });

    lib.addCSourceFile(.{
        .file = b.path("sokol.c"),
        .flags = &.{},
    });

    lib.installHeadersDirectory(b.path("."), "", .{});

    b.installArtifact(lib);
}
