%%%-------------------------------------------------------------------
%% @doc revlist public API
%% @end
%%%-------------------------------------------------------------------

-module(revlist_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    revlist_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
