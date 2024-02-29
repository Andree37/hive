const std = @import("std");
const tasks = @import("tasks.zig");
const time = @import("std").time;

pub fn main() !void {
    const t = time.now();
    const task = tasks.createTask("test title", "description", t, null);
    tasks.setTaskCompleted(task, true);

    std.debug.print("{}", .{task});
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
