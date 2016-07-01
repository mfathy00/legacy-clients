# legacy-clients.challenge

A Sinatra app that collects data about movies. Each movie has a `title`, `director` and a list of `actors`.

The app itself is RESTful and accepts `POST` request to the `movies` resource to create new records.

Example:

    # POST /movies with JSON payload:

    {
      "title": "Night on Earth",
      "director": "Jim Jarmusch",
      "actors": [
        "Isaac de Bankolé",
        "Roberto Benigni"
      ]
    }

However, the app has to deal with legacy clients that

- use a legacy endpoint `/create_movie`
- use GET instead of POST requests
- serialize arrays as XXX-separated lists

Example:

    GET /create_movie?title=Night%20on%20Earth&director=Jim%20Jarmusch&actors=Isaac%20de%20Bankol%C3%A9XXXRoberto%20Benigni

How to deal with the legacy clients?

## Requirements

Ruby as of version 2.1

## Installation

    bundle install

## Running the specs

    bundle exec rspec spec

## Starting a server

In case you need a server, you can start it using

    rackup

The server will be available at http://localhost:9292

For auto-reloading use the following command instead

    rerun rackup
