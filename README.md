## Build jekyll static website

    bundle install
    rake build

## Local development with Docker

    docker run --rm -it -v $PWD:/app -w /app -p 4000:4000 ruby:2.3 bash
    bundle install && rake develop open_in_browser=no
