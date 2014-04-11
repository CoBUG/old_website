-module(db_mgr).
-export([
    username_exists/1,
    add_user/7
]).

username_exists(User) ->
    SQL = "select username from users where username=?",
    db:qexists(SQL, [User]).

boolit(Val) ->
	case Val of
		"on" ->
			true;
		 _Else ->
			false
	end.

%% this is fugly - must find better way
add_user(Fname, Lname, User, Email, Hasxmpp, HasRemind, IsCo) ->
	SQL = "insert into user_queue (fname, lname, username, email, has_xmpp, reminders, co_native) values (?, ?, ?, ?, ?, ?, ?)",
	db:qu(SQL, [Fname, Lname, User, Email, boolit(Hasxmpp), boolit(HasRemind), boolit(IsCo)]).

