const c = @cImport({
    @cInclude("sqlite3.h");
});
const cache = @import("../sqlite/lib.zig");
const std = @import("std");
const assert = std.debug.assert;

// In memory test
test "test_sqlite_core_memory" {
    var db: ?*c.sqlite3 = null;
    var res: ?*c.sqlite3_stmt = null;

    var rc = c.sqlite3_open(":memory:", &db);
    assert(rc == c.SQLITE_OK);

    rc = c.sqlite3_prepare_v2(db, "SELECT SQLITE_VERSION()", -1, &res, 0);
    assert(rc == c.SQLITE_OK);

    rc = c.sqlite3_step(res);
    assert(rc == c.SQLITE_ROW);

    _ = c.sqlite3_finalize(res);
    _ = c.sqlite3_close(db);
}
