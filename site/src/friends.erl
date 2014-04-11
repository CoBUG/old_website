%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
-module (friends).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "CoBUG - Friends".

body() ->
    #container_12 { body=[
	common:header(),
        %% #grid_2 { body=sidebar() },
	#grid_2 { body=common:sidebar() },
        #grid_10 { body=inner_body() }
    ]}.

inner_body() ->
    [
	#h2 { text="Friends" },
	#hr{},
    #container_12 { body= [
        #grid_4 { body= #panel { body=[
                    #link { body=[ #image{ image="/images/nycbug.png", style="width: 178px" }], url="http://www.nycbug.org/" },
                    #hr{},
                    "NYC*BUG (pronounced 'nice bug') is the *BSD user group serving the metropolitan NYC area!"
                    ]
                }, class="webitem"
            }
    ]},
	#hr{},
	common:footer()
    ].
