const std = @import("std");

pub fn wordCount(reader:anytype) !i64 {
    var count: i64 = 0;
    var buffer: [1024]u8 = undefined;

    var buf = std.io.bufferedReader(reader);
    var r = buf.reader();
    
    while (try r.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
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
    var file = try std.fs.cwd().openFile("./example/file.txt", .{});
    defer file.close();
    var reader = file.reader();
    
    const expected:i64 = 5;
    const result:i64 = try wordCount(reader);
    try std.testing.expectEqual(expected, result);
}

test "test empty"{
    var file = try std.fs.cwd().openFile("./example/empty.txt", .{});
    defer file.close();
    var reader = file.reader();
    
    const expected:i64 = 0;
    const result:i64 = try wordCount(reader);
    try std.testing.expectEqual(expected, result);
}