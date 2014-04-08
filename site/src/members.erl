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
	common:header(),
	#grid_2 { body=common:sidebar() },
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
    #textbox { id=fname, class="form", placeholder="First Name", next=lname },
    #br{},
    #textbox { id=lname, class="form", placeholder="Last Name", next=email },
    #br{},
    #textbox { id=nname, class="form", placeholder="Nick Name (IRC name?)", next=email },
    " * This will be your XMPP account name if you choose to create one.",
    #br{},
    #textbox { id=email, class="form", placeholder="Email"},
    #br{},
    #textbox { id=emailconf, class="form", placeholder="Confirm Email"},
    #br{},
    #checkbox { id=createxmpp, text="Create XMPP account?", checked=true },
    #br{},
    #checkbox { id=reminders, text="Send me meeting reminders via email?", checked=false },
    #br{},
    #recaptcha{ id=my_recaptcha, button_id=recaptcha_button, button_label="Submit!", tag=human_verifier},
    #br{},
    #br{},
	#hr{},
	common:footer()
    ].

form_validator() ->

    ValidateUser = fun(_Tag, User) ->
            io:format("User Check: ~p", [User]),
            SQL = "select username from users where username=?",
            db:exists(SQL, [User])
    end,

  wf:wire(recaptcha_button, fname, #validate{validators=[
        #is_required{text="Required"}
    ]}),
  wf:wire(recaptcha_button, lname, #validate{validators=[
        #is_required{text="Required"}
    ]}),
  wf:wire(recaptcha_button, email, #validate{validators=[
        #is_email { text="Not a valid email address." }
    ]}),

  wf:wire(recaptcha_button, nname, #validate{validators=[
        #is_required{text="Required"},
        #custom{tag=ignore,text="Username Taken, please pick another.",function=ValidateUser}
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
