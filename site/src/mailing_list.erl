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
        common:header(),
        #grid_2 { body=common:sidebar() },
        #grid_10 { body=inner_body() }
    ]}.

inner_body() ->
    [
	#h2 { text="Mailing Lists" },
    #hr{},
	#p { text="The following mailing lists are available for public use:" },
    #list { body=[
        #listitem{ body="<b>announce@</b> Used for announcements primarily pertaining to CoBUG, but occasionally general BSD announcements as well." },
        #listitem{ body="<b>talk@</b> General discussion." },
        #listitem{ body="<b>tech@</b> Technical discussion for various BSD project related topics." }
    ]},
    #h3 { text="Subscribing / Unsubscribing to the list:" },
    #table { rows=[
        #tablerow { cells=[
            #tableheader { text="Action" },
            #tableheader { text="Address" },
            #tableheader { text="Description" }
          ]},
        #tablerow { cells=[
            #tablecell { text="Subscribe" },
            #tablecell { text="<listname>+subscribe@cobug.org" },
            #tablecell { text="Subscribes you to the specified <listname>." }
          ]},
        #tablerow { cells=[
            #tablecell { text="Subscribe Digest" },
            #tablecell { text="<listname>+subscribe-digest@cobug.org" },
            #tablecell { text="Subscribes you to the digest version of specified <listname>." }
          ]},
        #tablerow { cells=[
            #tablecell { text="Unsubscribe" },
            #tablecell { text="<listname>+unsubscribe@cobug.org" },
            #tablecell { text="Unsubscribes you from the specified <listname>." }
          ]},
        #tablerow { cells=[
            #tablecell { text="Help" },
            #tablecell { text="<listname>+help@cobug.org" },
            #tablecell { text="Sends you a brief email describing all the available mailing list commands." }
          ]}
    ]},
    #h3 { text="List Netiquette" },
    #list { 
        numbered=true,
        body= [
        #listitem{ body="Don't be a jerk." },
        #listitem{ body="Ask well thought-out questions." },
        #listitem{ body="Bottom respond (some people still use things like <b>mutt</b> and <b>pine</b>" },
        #listitem{ body="Advertising is strictly prohibited unless it's for a sanctioned BSD event!" }
    ]},
	#hr{},
	common:footer()
    ].
