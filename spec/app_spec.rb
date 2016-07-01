require "spec_helper"

describe App do
  let(:movie) do
    {
      title: "Night On Earth",
      director: "Jim Jarmusch",
      actors: [
        "Isaac de Bankolé",
        "Roberto Benigni",
        "Armin Mueller‑Stahl",
        "Winona Ryder"
      ]
    }
  end

  # Nice and shiny REST endpoint

  describe "POST /movies" do
    let(:payload) { movie }

    subject do
      post "/movies", payload
    end

    it "responds with 201 Created" do
      expect(subject.status).to be(201)
    end

    it "responds with the movie data" do
      expect(subject.body).to eq(movie.to_json)
    end
  end

  # Endpoint for legacy clients

  describe "GET /create_movie" do
    let(:params) do
      {
        title: movie[:title],
        director: movie[:director],
        actors: movie[:actors].join("XXX")
      }
    end

    subject do
      get "/create_movie", params
    end

    it "responds with 201 Created" do
      expect(subject.status).to be(201)
    end

    it "responds with the movie data" do
      expect(subject.body).to eq(movie.to_json)
    end
  end
end
