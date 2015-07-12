#docker-goagent

usage: `docker run -e USERNAME=test -e PASSWORD=test -d --name goagent -p 443:443 goagent`

local goagent config:

    [vps]
    enable = 1
    listen = 127.0.0.1:8089
    fetchserver = https://test:test@yourserver/
