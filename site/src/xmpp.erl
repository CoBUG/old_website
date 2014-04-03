%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
-module (xmpp).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "CoBUG - XMPP".

body() ->
    #container_12 { body=[
        header(),
        #grid_2 { body= sidebar() },
        #grid_10 { body=inner_body() }
    ]}.

inner_body() ->
    [
	#h2 { text="CoBUG XMPP Service" },
	#p { text="Potato!" },
	#hr{},
	footer()
    ].
	
