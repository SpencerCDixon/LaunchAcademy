class Television

  def initialize(screen_type, size)
    @screen_type = screen_type
    @size = size
  end

end

class TelevisionChannel

  def initialize(name, channel, year_started, number_of_shows)
    @name = name
    @channel = channel
    @year_started = year_started || nil
    @number_of_shows = number_of_shows || nil
  end

end


class TelevisionShow

  def initialize(args)
    @name = args[:name]
    @year_started = args[:start_date]
    @cast = args[:cast]
    @synopsis = args.fetch(:synopsis, nil)
    @studio = args.fetch(:studio, nil)
    @imbd_rating = args.fetch(:imbd_rating, nil)
  end

end
