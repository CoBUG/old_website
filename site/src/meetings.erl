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
	#h3{ text="Regular Meeting" },
	#p{ body=[ 
		"First and last Wednesday of the month at ",
		#link{ url="https://www.facebook.com/thedailygrindpueblo", text="The Daily Grind" },
		" in Pueblo Colorado!"
	]},
	#hr{},
	common:footer()
    ].
