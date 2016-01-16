-module(myapp_client).
-export([insert/3, read1/1, read2/1, delete/1]).
insert(Name, Desc, Date) ->
    db_server:insert(Name, Desc, Date).

read1(Name) ->
    db_server:read_desc(Name).

read2(Date) ->
    db_server:read_all(Date).

delete(Date) ->
    db_server:delete(Date).

