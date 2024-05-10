const std = @import("std");
const cache = @import("cache/lib.zig");

pub fn main() !void {
    std.debug.print(cache.word, .{});
}
