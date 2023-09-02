const std = @import("std");

pub const WordCounter = struct {
    pub fn count(self:WordCounter,reader:anytype) !i64 {
        _ = self;
        var total: i64 = 0;
        var buffer: [1024]u8 = undefined;

        var buf = std.io.bufferedReader(reader);
        var r = buf.reader();
        
        while (try r.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
            _ = line;
            total += 1;
        }
        return total;
    }
};

pub fn stdInWordCounter() !i64 {
    var reader = std.io.getStdIn().reader();
    const wc = WordCounter{};
    return try wc.count(reader);
}

pub fn main() !void{
    const result:i64 = try stdInWordCounter();
    std.debug.print("{d}", .{result});
}

test "test count"{
    var file = try std.fs.cwd().openFile("./example/file.txt", .{});
    defer file.close();
    var reader = file.reader();
    
    const expected:i64 = 5;
    const wc = WordCounter{};
    const result:i64 = try wc.count(reader);
    try std.testing.expectEqual(expected, result);
}

test "test empty"{
    var file = try std.fs.cwd().openFile("./example/empty.txt", .{});
    defer file.close();
    var reader = file.reader();
    
    const expected:i64 = 0;
    const wc = WordCounter{};
    const result:i64 = try wc.count(reader);
    try std.testing.expectEqual(expected, result);
}