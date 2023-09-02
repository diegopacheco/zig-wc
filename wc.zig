const std = @import("std");

fn wordCount(reader:anytype) !i64 {
    var count: i64 = 0;
    var buffer: [1024]u8 = undefined;
    while (try reader.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        _ = line;
        count += 1;
    }
    return count;
}

pub fn main() !void{
    var reader = std.io.getStdIn().reader();
    const total:i64 = try wordCount(reader);
    std.debug.print("{d}", .{total});
}

test "test count"{
    var writer = std.io.getStdIn().writer();
    writer.write("test 1\n");
    writer.write("test 2\n");
    
    var reader = std.io.getStdIn().reader();
    const total:i64 = try wordCount(reader);
    std.testing.expectEqual(2, total);
}