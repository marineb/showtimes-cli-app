class Showtimes::Scraper
    
  def scrape_showtimes(zipcode)
    url  = "https://www.google.com/movies?near=#{zipcode}"
    page = Nokogiri::HTML(open(url))

    page.css(".movie_results .theater").each do |showtimes|
      Showtimes::Theater.new_from_index_page(showtimes)
    end
  end

end