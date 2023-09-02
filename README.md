# zig-wc

Simple lib that mimic linux wc but written in Zig.

## Build
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