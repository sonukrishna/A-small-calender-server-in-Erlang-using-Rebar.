-module(myapp).

-behaviour(application).

%% Application callbacks
-export([start/2,start/0, stop/1, stop/0]).

%% ===================================================================
%% Application callbacks
%% ===================================================================
start() ->
    application:start(?MODULE).

start(_StartType, _StartArgs) ->
    myapp_sup:start_link().

stop() ->
    application:stop(?MODULE).

stop(_State) ->
    ok.
