%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
-module (aroundtheweb).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "CoBUG - Around the Web".

body() ->
    #container_12 { body= [ 
        header(),
        #grid_2 { body= sidebar() },
        #grid_8 { body=inner_body() }
    ]}.

inner_body() ->
    [
	#h2 { text="Around the Web" },
	#hr{},
    #container_12 { body= [
        #grid_4 { body= #panel { body=[
                    #image{image="/images/GitHub-Mark-32px.png"},
                    #link { text="GitHub/CoBUG", url="https://github.com/CoBUG" },
                    #hr{},
                    "Code for projects, presentations and more!"
                    ]
                }, class="webitem"
            },
        #grid_4 { body= #panel { body=[
                    #image{image="/images/Twitter_logo_blue.png"},
                    #link { text="twitter/cobsdug", url="https://twitter.com/cobsdug" },
                    #hr{},
                    "Twitter feed with updates on meetings and other group related events!"
                    ]
                }, class="webitem"
            }
    ]},
    #container_12 { body= [
        #grid_4 { body= #panel { body=[
                    #image{image="/images/cobsd_trimmed.png"},
                    #link { text="CoBUG Mailing Lists", url="http://akb.io:8000/mailing/list" },
                    #hr{},
                    "Public mailing lists!"
                    ]
                }, class="webitem"
            },
        #grid_4 { body= #panel { body=[
                    #image{image="/images/cobsd_trimmed.png"},
                    #link { text="CoBUG XMPP Service", url="http://akb.io:8000/xmpp" },
                    #hr{},
                    "XMPP service for members!"
                    ]
                }, class="webitem"
            }
    ]},

	#hr{},
	footer()

    ].
	
event(click) ->
    wf:insert_top(placeholder, "<p>You clicked the button!").