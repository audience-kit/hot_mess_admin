class Locale
  attr_accessor :name, :id, :label

  def self.all(connection)
    locales = connection.get('/v1/admin/locales')

    locales.body['locales'].map do |locale|
      Locale.new locale
    end
  end

  def initialize(data)
    self.id = data['id']
    self.name = data['name']
    self.label = data['label']
  end
end