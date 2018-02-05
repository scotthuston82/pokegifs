class PokemonController < ApplicationController

  def show
    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    body = JSON.parse(res.body)
    name  = body["name"]
    id = body["id"]
    types = body["types"]

    res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=v9gPATlZehkUA2wzb19TBTgHMFFbZc8r&q=#{name}&rating=g")
    body = JSON.parse(res.body)
    gif_url = body["data"][0]["url"]


    # @pokemon = Pokemon.all
    render json: { "ID": "#{id}", "Name": "#{name}", "Types": "#{types}", "gif_url": "#{gif_url}" }
  end
end
