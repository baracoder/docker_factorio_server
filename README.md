Factorio
========
Factorio Server in docker

This is a fork from https://github.com/zopanix/docker_factorio_server
with a little bit different docker file and more settings.

See [factorio's site](http://www.factorio.com)

Current Version
---------------
0.13.15

Tags
----

- latest
- 0.13.4
- 0.13.5
- 0.13.6
- 0.13.7
- 0.13.8
- 0.13.9
- 0.13.10
- 0.13.11
- 0.13.12
- 0.13.13
- 0.13.14
- 0.13.15



How to use ?
------------
```
docker run -d \
  -v [PATH]:/opt/factorio/saves \
  -p [PORT]:34197/udp \
  bara/factorio:latest
```
* Where [PATH] is a folder where you'll put your saves, if there already is a save in it with the string "save", that one will be taken by default, otherwize, a new one will be made.
* Where [PORT] is the port number you choose, if you're going to launch it on your local machine, don't use the port 34197, take another one at random.

Environment variables
---------------------

You can pass environment variables with `-e`

* `FACTORIO_AUTOSAVE_INTERVAL=2`
* `FACTORIO_AUTOSAVE_SLOTS=3`
* `FACTORIO_ALLOW_COMMANDS=false`
* `FACTORIO_NO_AUTO_PAUSE=false`
* `FACTORIO_LATENCY_MS=100`
* `FACTORIO_MODE=normal`

Server settings:

* `SERVER_NAME="factorio server"`
* `SERVER_DESCRIPTION=""`
* `SERVER_VISIBILITY="hidden"`
* `SERVER_GAME_PASSWORD=""`
* `SERVER_VERIFY_IDENTITY="true"`

