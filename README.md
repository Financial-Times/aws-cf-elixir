# AWS CloudFormation Templates for Erlang/Elixir Build and Application nodes

## Templates
### [`Build-Server.yaml`](Build-Server.yaml)

A build server with Erlang, Elixir and node.js installed via [asdf](https://github.com/asdf-vm/asdf), e.g. to build [Phoenix](http://www.phoenixframework.org/) project releases with [edeliver](https://github.com/ellispritchard/edeliver). 

In principle a server built with this template need not be restricted to Elixir builds, there's nothing special apart from the installation of various tools needed for building Elixir applications.



### [`Application.yaml`](Application.yaml)

A node configured with a user and init scripts for running a stand-alone Elixir app, as packaged by
[distillary](https://github.com/bitwalker/distillery) and installed by [edeliver](https://github.com/ellispritchard/edeliver).

Apart from the init scripts, again, there's nothing special here; in this case, we don't even install Erlang, since were targeting stand-alone applications.

The init script creates a user with the same name as the system-code given to the template. The template also requires the Erlang/Elixir application name so it can run the application script created by `edeliver`, e.g. if your Erlang application name is `myapp` and the system-code is `my-app-svc` then the user created on the node will be `my-app-svc` (with home directory `/home/my-app-svc`), and the application start-up script (to be created by `distillary` and installed by `edeliver`) is expected to be called `~myapp/distributions/myapp/bin/myapp`.

## Jenkins & edeliver

[edeliver](https://github.com/ellispritchard/edeliver) uses `ssh` to build on the build server, and `scp` to copy builds to the application servers.

In order to do this, the Jenkins user public key must be installed in the `.ssh/authorized_keys` file of the `build` user on the build node, and the application user (e.g. `my-app-svc`) on application nodes, with the correct user-read-only permissions (e.g. `700` on the `.ssh` directory, and `600` on the file).

