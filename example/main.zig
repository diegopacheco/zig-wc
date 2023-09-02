const std = @import("std");
const wc = @import("wc");

pub fn main() !void {
    var file = try std.fs.cwd().openFile("file.txt", .{});
    defer file.close();
    var reader = file.reader();

    const counter = wc.WordCounter{};
    const result: i64 = try counter.count(reader);
    std.debug.print("file.txt count = {d}", .{result});
}
