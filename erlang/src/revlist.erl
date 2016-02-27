%% @author ivankom
-module(revlist).

%% ====================================================================
%% API functions
%% ====================================================================
-export([reverse/1]).

reverse(List) when is_list(List) ->
    reverse(List, []).

%% ====================================================================
%% Internal functions
%% ====================================================================
reverse([], Acc) ->
    Acc;
reverse([H|List], Acc) ->
    reverse(List, [H|Acc]).

