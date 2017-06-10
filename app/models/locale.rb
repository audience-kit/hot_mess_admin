class Locale < ApplicationModel
  attr_accessor :name, :label, :created_at, :updated_at, :beacon_major, :envelope, :city_names, :event_count, :location_id, :timezone_zulu_delta, :connection, :venue_count, :hidden_venue_count

  def self.all(connection)
    locales = connection.get('/v1/admin/locales')

    locales.body.map do |locale|

      locale = Locale.new locale
      locale.connection = connection
      locale
    end
  end

  def self.find(connection, id)
    locale = connection.get("/v1/admin/locales/#{id}")

    puts locale.body
    locale = Locale.new locale.body
    locale.connection = connection

    locale
  end

  def venues
    @venues ||= Venue.all(self.connection, self.id)
  end
end