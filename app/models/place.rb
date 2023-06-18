class Place < ApplicationRecord
  belongs_to :user
  has_many :trips
  validates :city, :country, :neighborhood, presence: true
  gem 'net-http'
  require 'pg_search/model'


  def place_photos_url(city)
    country = Place.find_by(city: city).country
    url = "https://api.unsplash.com/photos/random?query=#{country}&client_id=-shGa_noh2by66rytVt-XE64s778ATFiqAjwohfdmcg"
    response = Net::HTTP.get(URI(url))
    photo_data = JSON.parse(response)
    if photo_data.present? && photo_data["urls"].present? && photo_data["urls"]["regular"].present?
      photo_data["urls"]["regular"]
    else
      "https://blog.hubspot.com/hs-fs/hub/53/file-2304825124-png/00-Blog_Thinkstock_Images/google-search-tips.png?width=595&height=400&name=google-search-tips.png"
    end
  end

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :country, :city ],
    using: {
      tsearch: { prefix: true }
    }

    def fetch_random_city_image
      response = RestClient.get 'https://api.unsplash.com/photos/random?query=city', {params: {client_id: OC47tUJ8sTjie4ghNrAo03aUPDi_OCxB8FP1rPaohFI}}

      data = JSON.parse(response.body)
      data["urls"]["small"]
    end
end
