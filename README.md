[![CircleCI](https://circleci.com/gh/dcycle/docker-clone-site.svg?style=svg)](https://circleci.com/gh/dcycle/docker-clone-site)

Make a clone of any website using [httrack](https://www.httrack.com).

For example:

    docker run --rm -v "$(pwd)/websites":/websites dcycle/clone-site:1 \
      https://blog.dcycle.com/

For multiple websites:

    for website in \
      blog.dcycle.com \
      example.com \
    ; do
      docker run --rm -v "$(pwd)/websites/$website:/websites/$website" \
        dcycle/clone-site:1 \
        "https://$website"
    done

This will create, in a local directory called ./websites/blog.dcycle.com, a directory with the entire contents of blog.dcycle.com.

See [this project on the Docker Hub](https://hub.docker.com/r/dcycle/clone-site/).
