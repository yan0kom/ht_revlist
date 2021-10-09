-module(revlist_test).
-behavior(gen_server).

%% ====================================================================
%% API functions
%% ====================================================================

-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

start_link() ->
    gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).

init([]) ->
    test(),
    {ok, []}.

test() ->
    io:format("Run list reverse tests~n"),
    ok = test_list([45,87,64,3,75], [75,3,64,87,45]),
    ok = test_list([61,29,10,6], [6,10,29,61]),
    ok = test_list([3,5], [5,3]),
    ok = test_list([23], [23]),
    ok = test_list([], []),
    io:format("All tests passed~n").

handle_call(_Meassage, _From, _State) -> test().
handle_cast(_Message, State) -> {noreply, State}.
handle_info(_Message, State) -> {noreply, State}.
terminate(_Reason, _State) -> ok.
code_change(_OldVersion, State, _Extra) -> {ok, State}.

%% ====================================================================
%% Internal functions
%% ====================================================================
test_list(Src, Res) when is_list(Src), is_list(Res) ->
    io:format("  source list ~p~n", [Src]),
    StdRev = lists:reverse(Src),
    io:format("  stdlib reverse ~p~n", [StdRev]),
    CustomRev = revlist:reverse(Src),
    io:format("  custom reverse ~p~n", [CustomRev]),
    if CustomRev == StdRev,  CustomRev == Res ->
           io:format("  test ok~n"), ok;
       true ->
           io:format("  test failed~n"), failed
       end.
