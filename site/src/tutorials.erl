%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
-module (tutorials).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "CoBUG - Tutorials".

body() ->
    #container_12 { body=[
        common:header(),
        #grid_2 { body=common:sidebar() },
        #grid_10 { body=inner_body() }
    ]}.

inner_body() ->
    [
	#h2 { text="BSD Tutorials" },
	#hr{},
	#p { text="Potato!" },
	#hr{},
	common:footer()
    ].
