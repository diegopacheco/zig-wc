const std = @import("std");

pub const WordCounter = struct {

    reader: std.io.Reader,

    pub fn count(self:WordCounter) !i64 {
        var total: i64 = 0;
        var buffer: [1024]u8 = undefined;

        var buf = std.io.bufferedReader(self.reader);
        var r = buf.reader();
        
        while (try r.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
            _ = line;
            total += 1;
        }
        return total;
    }
};

pub fn main() !void{
    var reader = std.io.getStdIn().reader();
    const wc = WordCounter{.reader = reader};
    const total:i64 = try wc.count(reader);
    std.debug.print("{d}", .{total});
}

test "test count"{
    var file = try std.fs.cwd().openFile("./example/file.txt", .{});
    defer file.close();
    var reader = file.reader();
    
    const expected:i64 = 5;
    const wc = WordCounter{.reader = reader};
    const result:i64 = try wc.count(reader);
    try std.testing.expectEqual(expected, result);
}

test "test empty"{
    var file = try std.fs.cwd().openFile("./example/empty.txt", .{});
    defer file.close();
    var reader = file.reader();
    
    const expected:i64 = 0;
    const wc = WordCounter{.reader = reader};
    const result:i64 = try wc.count();
    try std.testing.expectEqual(expected, result);
}