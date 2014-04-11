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
        common:header(),
        #grid_2 { body=common:sidebar() },
        #grid_10 { body=inner_body() }
    ]}.

inner_body() ->
    [
	#h2 { text="CoBUG XMPP Service" },
	#hr{},
    #h3{ text="XMPP aka Jabber" },
	#p { body=[
            "The xmpp service is availble to \"registered\" members. \
            These are members that have filled out the form on the ",
            #link{ url="/members", text="members" },
            " page.",
            #p{ text="Once one the xmpp service, come hang out in the 'discussion' chat room!" },
            #h3{ text="Suggested Clients" },
            #p{ body= [
                    "On the *BSDs the most common client seems to be ",
                    #link{ url="http://pidgin.im", text="Pidgin" },
                    " or ",
                    #link{ url="http://www.bitlbee.org/", text="Bitlbee" }
                ]}
    ]},
	#hr{},
	common:footer()
    ].
	
