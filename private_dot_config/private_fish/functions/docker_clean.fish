function docker_clean
    sudo docker rm -f $(sudo docker ps --all -q -f status=exited)

    docker rmi $(docker images -f "dangling=true" -q)

    echo "If there's nothing to clean this will show a missing param error"
end

