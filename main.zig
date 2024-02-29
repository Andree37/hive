const std = @import("std");

pub fn main() !void {
    std.log.info("hello world", .{}); // .{} is an anonymous tuple

    const one_plus_one = 1 + 1;
    std.debug.print("{}\n", .{one_plus_one});

    var array1: [5]u8 = undefined;
    array1[0] = 30;
    var array2 = [_]u8{ 1, 2, 3, 4, 5 };
    array2[0] = 10;

    var out_of_bounds = array1[2];
    std.debug.print("{}\n", .{out_of_bounds});

    const mat4x4 = [4][4]f32{
        [_]f32{ 1.0, 0.0, 0.0, 0.0 },
        [_]f32{ 0.0, 1.0, 0.0, 1.0 },
        [_]f32{ 0.0, 0.0, 1.0, 0.0 },
        [_]f32{ 0.0, 0.0, 0.0, 1.0 },
    };

    for (mat4x4) |row| {
        for (row, 0..) |cell, column_index| {
            std.debug.print("{} col index: {}\n", .{ cell, column_index });
        }
    }

    const greetings = "hello";

    std.debug.print("string: {s}\n", .{greetings});

    const array = [_]u8{ 1, 2, 3, 4, 5 }; // [_] = array with compile-time known size.
    const slice = array[0..array.len]; // "slice" represents the whole array.
    // slice[10] gives a runtime error.

    std.debug.print("slice {*}\n", .{slice});

    // Pointer on a value can be created with "&".
    const x: i32 = 1;
    const pointer: *i32 = &x; // "pointer" is a pointer on the i32 var "x".
    std.debug.print("1 = {}, {}\n", .{ x, pointer });

    // Pointer values are accessed and modified with ".*".
    if (pointer.* == 1) {
        std.debug.print("x value == {}\n", .{pointer.*});
    }

    // ".?" is a shortcut for "orelse unreachable".
    const foo = pointer.?; // Get the pointed value, otherwise crash.
    std.debug.print("foo = {}\n", .{foo});
}
