const std = @import("std");

pub fn main() !void{
    var reader = std.io.getStdIn().reader();
    var count: u32 = 0;
    var buffer: [1024]u8 = undefined;
    while (try reader.readUntilDelimiterOrEof(&buffer, '\n')) {
        count += 1;
    }
    std.debug.print("{d}", .{count});
}

test "happyPath" {
    
}