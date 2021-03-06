-define(ENCODER, jamdb_oracle_tns_encoder).
-define(DECODER, jamdb_oracle_tns_decoder).

-record(oraclient, {
    socket = undefined,
    conn_state = disconnected :: disconnected | connected | auth_negotiate,
    auto = 1 :: 1 | 0,
    type = select  :: select  | block | change | return,
    auth,
    fetch,
    server,
    cursors = [],
    params = [],
    env = []
}).

-record(format, {
    column_name = <<>>,
    param = in :: in | out,
    data_type,
    data_length,
    charset
}).

-define(IS_FIXED_TYPE(DataType),
    ?IS_NUMBER_TYPE(DataType);
    ?IS_BINARY_TYPE(DataType);
    ?IS_DATE_TYPE(DataType);
    ?IS_INTERVAL_TYPE(DataType)
).

-define(IS_NULL_TYPE(DataType),
    DataType =/= ?TNS_TYPE_LONG,
    DataType =/= ?TNS_TYPE_LONGRAW
).

-define(IS_CHAR_TYPE(DataType),
    DataType =:= ?TNS_TYPE_CHAR;
    DataType =:= ?TNS_TYPE_VARCHAR;
    DataType =:= ?TNS_TYPE_VCS
).

-define(IS_RAW_TYPE(DataType),
    DataType =:= ?TNS_TYPE_RAW;
    DataType =:= ?TNS_TYPE_VBI
).

-define(IS_NUMBER_TYPE(DataType),
    DataType =:= ?TNS_TYPE_NUMBER;
    DataType =:= ?TNS_TYPE_FLOAT;
    DataType =:= ?TNS_TYPE_VARNUM
).

-define(IS_BINARY_TYPE(DataType),
    DataType =:= ?TNS_TYPE_BFLOAT;
    DataType =:= ?TNS_TYPE_BDOUBLE
).

-define(IS_ROWID_TYPE(DataType),
    DataType =:= ?TNS_TYPE_ROWID;
    DataType =:= ?TNS_TYPE_RID
).

-define(IS_LOB_TYPE(DataType),
    DataType =:= ?TNS_TYPE_CLOB;
    DataType =:= ?TNS_TYPE_BLOB
).

-define(IS_LONG_TYPE(DataType),
    DataType =:= ?TNS_TYPE_LONG;
    DataType =:= ?TNS_TYPE_LONGRAW
).

-define(IS_INTERVAL_TYPE(DataType),
    DataType =:= ?TNS_TYPE_INTERVALYM;
    DataType =:= ?TNS_TYPE_INTERVALDS
).

-define(IS_DATE_TYPE(DataType),
    DataType =:= ?TNS_TYPE_DATE;
    DataType =:= ?TNS_TYPE_TIMESTAMP;
    DataType =:= ?TNS_TYPE_TIMESTAMPTZ;
    DataType =:= ?TNS_TYPE_TIMESTAMPLTZ
).

-define(ZONEIDMAP, [
{100, "America/New_York"},
{101, "America/Chicago"},
{103, "America/Los_Angeles"},
{250, "Asia/Shanghai"},
{254, "Asia/Hong_Kong"},
{267, "Asia/Tokyo"},
{402, "Europe/Moscow"},
{405, "Europe/Stockholm"},
{408, "Europe/Kiev"}
]).
