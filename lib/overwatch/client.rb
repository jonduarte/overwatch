module Overwatch
  class Client
    ENDPOINT = "https://overwatch-api.net/api/v1".freeze

    def initialize
    end

    def heroes
      get('/hero').fetch('data', []).collect do |hero|
        Hero.new(hero)
      end
    end

    def hero(id)
      Hero.new(get("/hero/#{id}"))
    end

    private

    def get(path)
      json_data(RestClient.get(ENDPOINT + path))
    end

    def json_data(response)
      JSON[response.body]
    end
  end
end
