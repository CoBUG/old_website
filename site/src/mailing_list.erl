%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
-module (mailing_list).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "CoBUG - Mailing Lists".

body() ->
    #container_12 { body=[
        header(),
        #grid_2 { body= sidebar() },
        #grid_8 { body=inner_body() }
    ]}.

inner_body() ->
    [
	#h2 { text="Mailing Lists" },
	#p { text="Potato!" },
	#hr{},
	footer()
    ].