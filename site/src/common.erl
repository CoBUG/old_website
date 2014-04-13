%% -*- mode: nitrogen -*-
-module (common).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

rand_str() ->
%% http://blog.teemu.im/2009/11/07/generating-random-strings-in-erlang/
	lists:foldl(fun(_, Acc) ->
                        [lists:nth(random:uniform(length("abcdefghijklmnopqrstuvwxyz")),
                                   "abcdefghijklmnopqrstuvwxyz")]
                            ++ Acc
                end, [], lists:seq(1, 5)).


header() ->
        #html5_header{ body= [
	    #image{ image="/images/cobsd_trimmed.png", class="logo" },
	    #h2{ text="Colorado BSD Users Group", class="pullright" }
	] }.

footer() ->
	#html5_footer{ body="CoBUG.org - 2014" }.

sidebar() ->
	[
		#h3 { text="CoBUG", class="co" },
		#list {
			body= [
				#listitem { body=[#link{ text="Home", url="/"}]},
				#listitem { body=[#link{ text="Contact", url="/contact"}]},
				#listitem { body=[#link{ text="Meetings", url="/meetings"}]},
				#listitem { body=[#link{ text="Tutorials", url="/tutorials"}]},
				#listitem { body=[#link{ text="Membership", url="/members"}]},
				#listitem { body=[#link{ text="Around the Web", url="/aroundtheweb"}]},
				#listitem { body=[#link{ text="Mailing List", url="/mailing/list"}]},
				#listitem { body=[#link{ text="XMPP", url="/xmpp"}]},
				#listitem { body=[#link{ text="Friends", url="/friends"}]}
			]
		},
		#h3 { text="Events", class="co" },
		#list {
			body= [
				#listitem { body= [
						#bubble{
							text="2014-04-16",
							bubble_title="Meeting at The Daily Grind",
							bubble_body= [
								"Meeting starts at 6:30pm. Topics will include Building OpenBSD from source, info about the new CoBUG and more!"
							]}
					]}
			]
		},
		#h3 { text="*BSD", class="co" },
		#list {
			body= [
				#listitem { body=[#link{ text="OpenBSD", url="http://www.openbsd.org"}]},
				#listitem { body=[#link{ text="NetBSD", url="http://www.netbsd.org"}]},
				#listitem { body=[#link{ text="FreeBSD", url="http://www.freebsd.org"}]},
				#listitem { body=[#link{ text="DragonFlyBSD", url="http://www.dragonflybsd.org"}]},
				#listitem { body=[#link{ text="Bitrig", url="http://www.bitrig.org"}]}
			]
		}
	].
