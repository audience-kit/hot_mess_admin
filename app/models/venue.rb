class Venue < ApplicationModel
  attr_accessor :locale_id, :hidden, :order, :distance_tolerance, :location_id,
                :page_id, :connection, :name, :facebook_id, :google_place_id, :display_name,
                :event_count, :created_at, :updated_at, :name_override, :facebook_graph, :facebook_access_token,
                :facets, :requires_user_token, :photo_id, :cover_photo_id, :locale, :audience_id

  def self.all(connection, locale_id)
    url = locale_id ? "/v1/admin/locales/#{locale_id}/venues" : "/v1/admin/venues"

    connection.get(url).body.map do |item|
      puts "Venue => #{item}"
      venue = Venue.new item
      venue.connection = connection

      venue
    end
  end

  def self.create(connection, locale_id, facebook_id, google_place_id)
    connection.post("/v1/admin/locales/#{locale_id}/venues", { facebook_id: facebook_id, google_place_id: google_place_id}).body.map do |item|
      puts "Create Venue => #{item}"
      venue = Venue.new item
      venue.connection = connection

      venue
    end
  end

  def self.missing_google(connection)
    connection.get("/v1/admin/venues/missing_google").body.map do |item|
      puts "Venue => #{item}"
      venue = Venue.new item
      venue.connection = connection

      venue
    end
  end

  def events
    []
  end
end