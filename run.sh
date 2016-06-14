#!/bin/bash
require_env=(
    USERNAME
    PASSWORD
)
for i in ${require_env[@]}; do
    if [ x${!i} == 'x' ]; then
        echo "Need env ${i}"
        exit 1;
    fi
done
echo "${USERNAME} ${PASSWORD}" > /opt/goagent/goagentvps.conf
sh /opt/goagent/goagentvps.sh start
tail -F /opt/goagent/log/*.log