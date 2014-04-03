%% Include the automatically generated plugins directory
-include("plugins.hrl").
-compile(export_all).

%% Include any application-specific custom elements, actions, or validators below

header() ->
        #html5_header{ body= [
	    #image{ image="/images/cobsd_trimmed.png", class="logo" },
	    #h2{ text="Colorado BSD Users Group", class="pullright" }
	]}.

footer() ->
	#html5_footer{ body="CoBUG.org - 2014" }.

sidebar() ->
	[
		#h3 { text="CoBUG", class="co" },
		#list {
			body= [
				#listitem { body=[#link{ text="Home", url="http://www.akb.io:8000"}]},
				#listitem { body=[#link{ text="Contact", url="http://www.akb.io:8000/contact"}]},
				#listitem { body=[#link{ text="Tutorials", url="http://www.akb.io:8000/tutorials"}]},
				#listitem { body=[#link{ text="Mailing List", url="http://www.akb.io:8000/mailing/list"}]},
				#listitem { body=[#link{ text="XMPP", url="http://www.akb.io:8000/xmpp"}]},
				#listitem { body=[#link{ text="Around the Web", url="http://www.akb.io:8000/aroundtheweb"}]}
			]
		},
		#h3 { text="*BSD", class="co" },
		#list {
			body= [
				#listitem { body=[#link{ text="OpenBSD", url="http://www.openbsd.org"}]},
				#listitem { body=[#link{ text="NetBSD", url="http://www.netbsd.org"}]},
				#listitem { body=[#link{ text="FreeBSD", url="http://www.freebsd.org"}]},
				#listitem { body=[#link{ text="Bitrig", url="http://www.bitrig.org"}]}
			]
		},
		#h3 { text="Events", class="co" },
		#list {
			body= [
				#listitem { body="2014-04-03"},
				#listitem { body="OpenBSD"}
			]
		}
	].
