%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
-module (contact).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "CoBUG - Contact".

body() ->
    #container_12 { body=[
        common:header(),
        #grid_2 { body=common:sidebar() },
        #grid_10 { body=inner_body() }
    ]}.

inner_body() -> 
    [
        #h2 {text="Contact Info"},
        #hr{},
        #h3{ body="Email"},
        #p {text="Send questions regarding XMPP, mailing lists and other services to: admin@cobug.org"},
        #p {text=""},
        #h3{ body="Google+"},
        #p {body = [
                "A ",
                #link{ url="https://plus.google.com/u/0/communities/112224531372695972083", text="Google+ Community" },
                " exists for general member communication / event planning!"
            ]},
        #hr{},
        common:footer()
    ].
