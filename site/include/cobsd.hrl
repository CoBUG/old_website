body() ->
    #container_12 { body=[
        #html5_header{ body= [
	    #image{ image="/images/cobsd_trimmed.png", class="logo" }
	]},
        #grid_2 { body=sidebar() },
        #grid_8 { body=inner_body() }
    ]}.

sidebar() ->
	[
		#h2 { text="CoBUG" },
		#list {
			body= [
				#listitem { body=[#link{ text="Home", url="http://www.akb.io:8000"}]},
				#listitem { body=[#link{ text="About", url="http://www.akb.io:8000/about"}]},
				#listitem { body=[#link{ text="OpenBSD", url="http://www.openbsd.org"}]},
				#listitem { body=[#link{ text="NetBSD", url="http://www.netbsd.org"}]},
				#listitem { body=[#link{ text="FreeBSD", url="http://www.freebsd.org"}]},
				#listitem { body=[#link{ text="Bitrig", url="http://www.bitrig.org"}]},
				#listitem { body=[#link{ text="Tutorials", url="http://www.akb.io:8000/tutorials"}]},
				#listitem { body=[#link{ text="Mailing List", url="http://www.akb.io:8000/mailing/list"}]},
				#listitem { body=[#link{ text="XMPP", url="http://www.akb.io:8000/xmpp"}]}
			]
		},
		#h2 { text="Events" },
		#list {
			body= [
				#listitem { body="2014-04-03"},
				#listitem { body="OpenBSD"}
			]
		}
	].

inner_body() ->
    [
	#h2 { text="Seting up a DragonFlyBSD NAS" },
	#p { text="Potato!" },
	#hr{},
	#html5_footer{ body="CoBUG.org - 2014"}
    ].
