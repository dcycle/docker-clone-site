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

Once that is done, let's say you want to search all websites for a specific string (say, "fbq(", if you want to check for the Facebook Pixel), you can run:

    # Fail if fbq( is not present.
    grep -iR 'fbq(' ./websites

or

    # Fail if fbq( is present.
    ! grep -iR 'fbq(' ./websites

See [this project on the Docker Hub](https://hub.docker.com/r/dcycle/clone-site/).
See [this project on GitHub](https://github.com/dcycle/docker-clone-site/).
