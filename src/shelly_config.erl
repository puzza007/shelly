%% Copyright (c) 2012-2016 Peter Morgan <peter.james.morgan@gmail.com>
%%
%% Licensed under the Apache License, Version 2.0 (the "License");
%% you may not use this file except in compliance with the License.
%% You may obtain a copy of the License at
%%
%% http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing, software
%% distributed under the License is distributed on an "AS IS" BASIS,
%% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%% See the License for the specific language governing permissions and
%% limitations under the License.

-module(shelly_config).


-export([enabled/1]).
-export([port/1]).
-export([system_dir/0]).
-export([user_dir/0]).


port(sshd) ->
    envy:to_integer(shelly, port, default(22)).


enabled(sshd) ->
    envy:to_boolean(shelly, enabled, default(true)).


system_dir() ->
    envy:to_list(shelly, system_dir, default(shelly:priv_file("ssh"))).


user_dir() ->
    envy:to_list(shelly, user_dir, default(shelly:priv_file("ssh"))).


default(Default) ->
    [os_env, {default, Default}].