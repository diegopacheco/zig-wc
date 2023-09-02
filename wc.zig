const std = @import("std");

pub fn main() !void{
    var reader = std.io.getStdIn().reader();
    var count: u32 = 0;
    var buf: [1000]u8 = undefined;
    while (try reader.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        _ = line;
        count += 1;
    }
    std.debug.print("lines {}", .{count});
}

test "happyPath" {
    
}