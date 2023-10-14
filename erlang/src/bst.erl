-module(bst).
-import(lists,[append/2]). 
-export([start/0, count_params/0, loop/2, file_read/0, write_res/1]).


start() ->
  case io:fread("File or console (f/c) --> ", "~s") of
    {ok, ["f"]} -> 
      file_read();
    {ok, ["c"]} -> 
      count_params();
    {ok, [_]} ->
      io:fwrite("~nyou need enter \"f\" or \"c\". Try again~n~n"),
      start()
  end.


file_read() ->
  {ok, [FN]} = io:fread("enter file name --> ", "~s"),
  case file:open(FN, [read]) of
    {ok, Data} -> 
      Text = io:get_line(Data, ''),
      Numbers = [ element(1, string:to_integer(Substr)) || Substr <- string:tokens(Text, ", ")],
      file:close(Data),
      case sum(Numbers, 0) == error of 
        true ->
          io:fwrite("~n incorect numders. Check text~n~n");
        false -> 
          write_res(Numbers)
      end;
    {error, Why} ->
      io:fwrite("~w~n can`t open this file~n", [Why]),
      file_read()
  end.

write_res(Numbers) ->
  case file:open("res.txt", [write]) of
    {ok, Data} -> 
      io:fwrite(Data, "sum ~w ~n", [sum(Numbers, 0)]);
    {error, Why} ->
      io:fwrite("~w~n can`t open file \"res.txt\"~n", [Why]),
      file_read()
  end.

count_params() ->
  case io:fread("how many params you want --> ", "~d") of
    {ok,[N]} -> 
      io:fwrite("you need enter ~w parametrs ~n", [N]),
      New_list = loop(N, []),
      io:fwrite("sum ~w ~n", [sum(New_list, 0)]);
    {error, Why} ->
      io:fwrite("~n~w~nyou need enter integer parametrs. Try again~n~n", [Why]),
      count_params()
  end.

loop(0, List) ->
  List;
loop(N, List) ->
  case io:fread("enter>> ", "~d") of
    {ok,[K]} ->
      New = List++[K],
      loop(N-1, New);
    {error, Why} ->
      io:fwrite("~n~w~nyou need enter integer parametrs. Try again~n~n", [Why]),
      loop(N, List)
  end.

sum([], S) ->
  S;
sum([H|T], S) ->
  case H == error of
    true ->
      error;
    false ->
      sum(T, S+H)
  end.



