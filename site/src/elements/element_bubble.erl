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
render_element(Record) ->
    BubID = "bubble_" ++ common:rand_str(),
    CliID = "bubble_" ++ common:rand_str(),
    Body = [
        #link { body=Record#bubble.text, html_id=CliID },
        #panel { class="bubble", html_id=BubID, body=[
            #label { text=Record#bubble.bubble_title },
            #value { text=Record#bubble.bubble_body }
        ]}
    ],

    Script = wf:f(
        "$('#~s').click(function() { $('#~s').toggle(); });",
        [
            CliID,
            BubID
        ]),

    wf:wire(Script),

    wf_tags:emit_tag(li, Body, [
            {id, Record#bubble.html_id},
            {class, ["bubble_parent"]},
            {title, Record#bubble.title},
            {role, Record#bubble.role},
            {style, Record#bubble.style},
            {data_fields, Record#bubble.data_fields}
        ]).
