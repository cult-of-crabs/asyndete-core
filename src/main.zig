const std = @import("std");
const tess = @import("tests/lib.zig");
const cache = @import("cache/lib.zig");

pub fn main() !void {
    std.debug.print(cache.word, .{});
}
