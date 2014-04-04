%% -*- mode: nitrogen -*-
%% vim: ts=4 sw=4 et
-module (members).
-compile(export_all).
-include_lib("nitrogen_core/include/wf.hrl").
-include("records.hrl").

main() -> #template { file="./site/templates/bare.html" }.

title() -> "CoBUG - Members".

body() ->
    form_validator(),
    #container_12 { body=[
	header(),
	#grid_2 { body= sidebar() },
        #grid_10 { body=inner_body() }
    ]}.

inner_body() ->
    [
	#h2 { text="CoBUG Membership" },
	#hr{},
	#p { text="Membership is open to absolutely anyone and affords you access \
        to the official CoBUG XMPP server and the chance to win sweet prizes! \
        " },
	#h3 { text="Membership Form" },
    #textbox { id=fname, text="First Name", next=lname },
    #br{},
    #textbox { id=lname, text="Last Name", next=email },
    #br{},
    #textbox { id=nname, text="Nick Name (IRC name?)", next=email },
    #br{},
    #textbox { id=email, text="Email"},
    #br{},
    #textbox { id=emailconf, text="Confirm Email"},
    #br{},
    #checkbox { id=createxmpp, text="Create XMPP account?", checked=true },
    #br{},
    #checkbox { id=reminders, text="Send me meeting reminders via email?", checked=false },
    #br{},
    #recaptcha{ id=my_recaptcha, button_id=recaptcha_button, button_label="Submit!", tag=human_verifier},
    #br{},
    #br{},
	#hr{},
	footer()
    ].

form_validator() ->
  wf:wire(recaptcha_button, fname, #validate{validators=[
        #is_required{text="Required"}
    ]}),
  wf:wire(recaptcha_button, lname, #validate{validators=[
        #is_required{text="Required"}
    ]}),
  wf:wire(recaptcha_button, email, #validate{validators=[
        #is_email { text="Not a valid email address." }
    ]}),

  wf:wire(recaptcha_button, emailconf, #validate{validators=[
    #confirm_same { text="Emails do not match", confirm_id=email }
    ]}).
 
  recaptcha_event(human_verifier, {error, ErrorMessage}) ->
    wf:wire(#alert{text="Way to fail the human test!" ++ ErrorMessage}),
    ok;
  recaptcha_event(human_verifier, ok) ->
    [Fname,Lname,Email] = wf:mq([fname,lname,email]),
    wf:wire(#alert{text="Membership request submitted successfully!"}),
    io:format("User: ~p ~p <~p>~n", [Fname, Lname, Email]),
    ok.

event(goButton) ->
    [Fname,Lname,Email] = wf:mq([fname,lname,email]),
    wf:wire(#alert{text="Membership request submitted successfully!"}),
    io:format("User: ~p ~p <~p>~n", [Fname, Lname, Email]).
