%% @author ivankom
-module(revlist_test).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/0]).

start() ->
    io:format("Run list reverse tests~n"),
    ok = test_list([45,87,64,3,75], [75,3,64,87,45]),
    ok = test_list([61,29,10,6], [6,10,29,61]),
    ok = test_list([3,5], [5,3]),
    ok = test_list([23], [23]),
    ok = test_list([], []),
    io:format("All tests passed~n").

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

