%% -*- mode: nitrogen -*-
-module (index).
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
	#h2 { text="Who We Are" },
	#hr{},
	#p { text="Created in 2014, CoBUG is a completely open BSD community, \
	established with the intention of spreading love for the BSDs." },
	#p { text="CoBSD offers a number of free community oriented features in \
	the hopes of facilitating growth, awareness, hacking and use of \
	*BSD in Colorado." },
	#hr{},
	common:footer()
    ].
