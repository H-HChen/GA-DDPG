
#!/usr/bin/env bash

BASH_OPTION=bash

IMG=iscilab/gaddpg:cuda-20-04
containerid=$(docker ps -qf "ancestor=${IMG}") && echo $containerid

xhost +

if [[ -n "$containerid" ]]
then
    docker exec -it \
        --privileged \
        -e DISPLAY=${DISPLAY} \
        -e LINES="$(tput lines)" \
        gaddpg_ros \
        $BASH_OPTION
else
    docker start -i gaddpg_ros
fi
