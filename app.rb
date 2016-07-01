require "json"
require "sinatra"
require "sinatra/base"

class App < Sinatra::Base
  before do
    content_type :json
  end

  post "/movies" do
    movie = {
      title: params["title"],
      director: params["director"],
      actors: params["actors"]
    }

    # [status, body]
    [201, movie.to_json]
  end

  get "/create_movie" do
    movie = {
      title: params["title"],
      director: params["director"],
      actors: params["actors"].split('XXX')
    }

    # [status, body]
    [201, movie.to_json]
  end
end
