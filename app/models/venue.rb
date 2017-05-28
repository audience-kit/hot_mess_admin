class Venue < ApplicationModel
  attr_accessor :locale_id, :hidden, :order, :distance_tolerance, :location_id,
                :page_id, :connection, :name, :facebook_id, :google_place_id, :display_name,
                :event_count

  def self.all(locale_id, connection)
    connection.get("/v1/admin/locales/#{locale_id}/venues").body.map do |item|
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