# mcb32tools-docker
Docker buildfile specifying a container with the **mcb32tools** toolchain for easy
communication with the **ChipKit Uno32**.

## Instructions
1. Find out the TTY that the ChipKit Uno32 board is currently bound to (usually
   something like `/dev/ttyUSB0`).
2. Start the container with this information. (See the command examples).
   Be sure to specify a `--device` flag with the TTY information as well
   as to bind a working directory for the source code.
3. The container will be opened. Run `make` / `make install` as usual.
4. When you're done. Exit the container and use docker start/stop as usual to
   control the container.

## Command examples
### Build the image
`docker build -t mcb32 .`

Will build a Docker image from the Dockerfile in the current directory.

### Run the container
```
docker run --interactive \
           --tty \
           --device=/dev/ttyUSB0 \
           --volume "$PWD":/home \
           --name mcb32tools \ mcb32
```
Will start a running container from the image `mcb32`.

Short info about the arguments:  
`--interactive`: Will keep the containers `STDIN` open even if the host is
                 not attached.  
`--tty`: Allocates a pseudo-TTY for the Docker container.  
`--device`: Adds the host device `/dev/ttyUSB0` to the container.  
`--volume`: Binds the current working directory to the `/home` directory in the
            container.  
`--name`: Sets the name for the container to `mcb32tools`.

#### Chained command for easy copy-paste-fu
`docker run --interactive --tty --device=/dev/ttyUSB0 --volume "$PWD":/home --name mcb32tools mcb32`

**NOTE**: *All credit and licensing regarding mcb32tools goes to their respective creators at:
https://github.com/is1200-example-projects/mcb32tools/releases/*
