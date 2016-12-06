class ExampleApi

  attr_reader :url, :music_data

  def initialize(url)
    @url = url
    @music_data = JSON.parse(RestClient.get(url))
  end

  def make_albums
    albums = []
    all_albums = music_data["tracks"]["items"]
    all_albums.each do |album|
      album_name = album["name"]
      albums << ExampleModel.new(album_name)
    end
    albums
  end

end
