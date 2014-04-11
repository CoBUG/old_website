%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
-module (element_bubble).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").
-export([
    reflect/0,
    render_element/1
]).

-spec reflect() -> [atom()].
reflect() -> record_info(fields, bubble).

-spec render_element(#bubble{}) -> body().
render_element(_Record = #bubble{}) ->
    "<b>Hello from bubble</b>".
