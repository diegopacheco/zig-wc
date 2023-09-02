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