This buildpack can either download precompiled binary hosted in this repository, or build from source.

It is preferable to build from the binary stored in this repo, because it is much faster, but if you want to recompile with different options, you can call `build_from_source` instead of `build_from_binary`.

Once you build from source, open up a one off dyno and create a tarball of the compiled binary's directory:

`tar czf openresty_build-<open_resty version number>.tar.gz .heroku/`

We then use `scp` to copy the tarball to our local machine, using ngrok.

`ngrok tcp 22`

then run in the one off dyno.
`scp -P <port ngrok returns> openresty_build-<open_resty version number> <local user>@0.tcp.ngrok.io:openresty_build-<open_resty version number>.tar.gz`

After you do that, publish another release to this repo, and update the compile script to reference the link to the new tarball.
