class ExampleCLI

  def call
    puts "Welcome, what Spotify Artist should I use?"
    run
  end

  def get_user_input
    gets.chomp.strip
  end

  def run
    print "New search keyword: "
    input = get_user_input
    if input == "help"
      help
    elsif input == "exit"
      exit
    else
      search(input)
    end
    run
  end

  def search(input)
    search_term = input.split(" ").join("%20").downcase
    puts "Your search term was #{input.capitalize}, I am searching..."
    url = "https://api.spotify.com/v1/search?q=#{search_term}&type=track&market=US"
    albums = ExampleApi.new(url).make_albums
    puts "Thank you for your patience. I found this on Spotify:"
    albums.each do |album|
      puts album.example
    end
  end

  def help
    puts "Type 'exit' to exit"
    puts "Type 'help' to view this menu again"
    puts "Type anything else to search for an Artist's albums"
  end

end
