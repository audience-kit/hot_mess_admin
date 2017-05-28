class Locale < ApplicationModel
  attr_accessor :name, :label, :created_at, :updated_at, :beacon_major, :envelope, :location_id, :timezone_zulu_delta, :connection

  def self.all(connection)
    locales = connection.get('/v1/admin/locales')

    locales.body.map do |locale|

      locale = Locale.new locale
      locale.connection = connection
      locale
    end
  end

  def self.find(id, connection)
    locale = connection.get("/v1/admin/locales/#{id}")

    puts locale.body
    locale = Locale.new locale.body
    locale.connection = connection

    locale
  end

  def venues
    @venues ||= Venue.all(self.id, self.connection)
  end
end