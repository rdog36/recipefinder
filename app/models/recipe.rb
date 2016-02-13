require 'httparty'

class Recipe
  include HTTParty
	
  ENV["FOOD2FORK_KEY"] = "604a5c93a659d48ddb82ed58499b0fe4"
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
	
  base_uri "http://#{hostport}/api"
  default_params key: ENV["FOOD2FORK_KEY"]
  #default_params key: "604a5c93a659d48ddb82ed58499b0fe4"
  format :json

  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end
end

