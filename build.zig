const std = @import("std");

fn addMupdfDeps(exe: *std.Build.Step.Compile, target: std.Target) void {
    if (target.os.tag == .macos and target.cpu.arch == .aarch64) {
        exe.addIncludePath(.{ .cwd_relative = "/opt/homebrew/include" });
        exe.addLibraryPath(.{ .cwd_relative = "/opt/homebrew/lib" });
    } else if (target.os.tag == .macos and target.cpu.arch == .x86_64) {
        exe.addIncludePath(.{ .cwd_relative = "/usr/local/include" });
        exe.addLibraryPath(.{ .cwd_relative = "/usr/local/lib" });
    } else if (target.os.tag == .linux) {
        const linux_libs = [_][]const u8{
            "mupdf",    "mupdf-third", "harfbuzz",
            "freetype", "jbig2dec",    "jpeg",
            "openjp2",  "gumbo",       "mujs",
        };
        for (linux_libs) |lib| exe.linkSystemLibrary(lib);
    }
    exe.linkSystemLibrary("mupdf");
    exe.linkSystemLibrary("z");
    exe.linkLibC();
}

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "fancy-cat",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const deps = .{
        .vaxis = b.dependency("vaxis", .{ .target = target, .optimize = optimize }),
        .fzwatch = b.dependency("fzwatch", .{ .target = target, .optimize = optimize }),
    };

    exe.root_module.addImport("vaxis", deps.vaxis.module("vaxis"));
    exe.root_module.addImport("fzwatch", deps.fzwatch.module("fzwatch"));
    exe.root_module.addImport("config", b.addModule("config", .{ .root_source_file = b.path("src/config.zig") }));

    addMupdfDeps(exe, target.result);
    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    if (b.args) |args| run_cmd.addArgs(args);
    b.step("run", "Run the app").dependOn(&run_cmd.step);
}
