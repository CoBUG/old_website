%% -*- mode: nitrogen -*-
-module (meetings).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "CoBUG".

body() ->
    #container_12 { body=[
	common:header(),
        %% #grid_2 { body=sidebar() },
	#grid_2 { body=common:sidebar() },
        #grid_10 { body=inner_body() }
    ]}.

inner_body() ->
    [
	#h2 { text="Meetings" },
	#hr{},
	#p{text="More Potato!"},
	#hr{},
	common:footer()
    ].
