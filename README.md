# hostexec

An example pattern for executing scripts on the docker host. If you want something to quickly execute command, check singelet/

## Usage

Put the commands you want to execute on the host in `host.sh`.

Run the resulting image as a privileged container passing in the host's PID namespace, like this:

`docker run -it --rm --privileged --pid=host singelet/hostexec`

## Alternatives

If you want to just execute a simple command, check out quickhostexec (alpine:edge), or justincormack/nsenter1 (static simple nsenter).

## How it works

It uses nsenter to switch to the namespaces of PID 1. Once it's entered the host, it looks for the location of `host.sh` on the sub-container's overlay, and executes it. This is required because the host's /usr/local/bin isn't the same place as the sub-container's.
