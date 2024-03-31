const tic = @import("tic80.zig");

export fn BOOT() void {}

export fn TICK() void {
    tic.sync(.{
        .sections = .{.tiles = true},
        .bank = 1,
        .toCartridge = true
    });

    tic.cls(0);
}

export fn BRDR() void {}

export fn OVER() void {}