%% Include the automatically generated plugins directory
-include("plugins.hrl").
-compile(export_all).

%% Include any application-specific custom elements, actions, or validators below
-record(bubble, {?ELEMENT_BASE(element_bubble),
        html_encode :: any(),
        body :: any(),
        title :: any(),
        role :: any(),
        bubble_body :: any(),
        bubble_title :: any(),
        text :: any()
    }).

