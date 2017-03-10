class CreateVenue
  include ActiveModel::Model

  attr_accessor :facebook_id, :google_place_id, :locale_id

  validates_presence_of :locale_id

  def to_model
    unless self.valid?
      Rails.logger.info "Validation errors => #{self.errors.inspect}"
      return HotMessModels::Venue.new locale_id: self.locale_id
    end

    facebook_graph = {}
    google_location = {}
    name = nil

    if self.google_place_id
      google_client = ::GooglePlaces::Client.new(Rails.application.secrets.google_api_key)

      google_location = google_client.spot self.google_place_id

      name = google_location['name']
    end

    if self.facebook_id
      graph = Koala::Facebook::API.new HotMessModels::User.find_by(email_address: 'rickmark@outlook.com').facebook_token

      Rails.logger.info "Reading graph for #{self.facebook_id}"
      facebook_graph = graph.get_object self.facebook_id

      name = facebook_graph['name']
    end

    venue = HotMessModels::Venue.new  name: name,
                                      locale_id: self.locale_id,
                                      facebook_id: facebook_graph['id'],
                                      facebook_graph: facebook_graph,
                                      facebook_updated_at: facebook_graph ? DateTime.now : nil,
                                      google_place_id: self.google_place_id,
                                      google_location: google_location,
                                      google_updated_at: google_location ? DateTime.now : nil

    venue.update_location google_location['lng'], google_location['lat']

    venue
  end
end