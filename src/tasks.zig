const time = @import("std").time;

const Tag = struct {
    name: []const u8,
    color: u32,
};

const Task = struct {
    title: []const u8,
    description: []const u8,
    completed: bool,
    dueYear: u16,
    dueMonth: u8,
    dueDay: u8,
    tags: []Tag,
};

pub fn createTask(title: []const u8, description: []const u8, dueYear: u16, dueMonth: u8, dueDay: u8, tags: []Tag) Task {
    return Task{
        .title = title,
        .description = description,
        .completed = false,
        .dueYear = dueYear,
        .dueMonth = dueMonth,
        .dueDay = dueDay,
        .tags = tags,
    };
}

pub fn setTaskCompleted(task: *Task, completed: bool) void {
    task.completed = completed;
}

fn isDateToday(task: Task, year: u16, month: u8, day: u8) bool {
    return year == task.year and
        month == task.month and
        day == task.day;
}

fn daysUntil(task: Task, year: u16, month: u8, day: u8) i32 {
    const todayTimestamp = time.dateToUnixTimestamp(.{ task.year, task.month, task.day });
    const targetTimestamp = time.dateToUnixTimestamp(.{ year, month, day });

    const differenceInSeconds = targetTimestamp - todayTimestamp;
    return i32(differenceInSeconds / time.secondsPerDay);
}
