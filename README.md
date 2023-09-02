# zig-wc

Simple lib that mimic linux wc but written in Zig by <a href="https://diegopacheco.github.io/">Diego Pacheco</a>

## Build
```bash
zig build
```
## Tests
```bash
zig test wc.zig
```
```bash
All 2 tests passed.
```
## Release
```bash
zig build -Doptimize=ReleaseFast
```
## Running it
```bash
cat example/file.txt | zig-out/bin/wc
```
```
5
```

### Usage as lib API
```Zig
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
```
#### Build and run the Example
```bash
cd example/
zig build run
```
```bash
file.txt count = 5%
```
