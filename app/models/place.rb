class Place < ApplicationRecord
  has_many :users, through: :trip
  has_many :trips
  validates :city, :country, :neighborhood, presence: true
  gem 'net-http'

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

end
