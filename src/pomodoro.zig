const Timer = struct {
    workDuration: u32, // Work time in seconds
    breakDuration: u32, // Break time in seconds
    state: TimerState,
};

const TimerState = enum {
    Idle,
    Working,
    Break,
};
