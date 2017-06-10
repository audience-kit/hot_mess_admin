class Person < ApplicationModel
  attr_accessor :page_id, :order, :global, :like_required, :connection, :display_name, :locale, :created_at,
                :updated_at, :name, :name_override, :facebook_id, :facebook_graph, :facebook_access_token,
                :facets, :requires_user_token, :hidden, :photo_id, :cover_photo_id, :audience_id

  def self.all(connection)
    people = connection.get('/v1/admin/people')

    people.body.map do |person|

      model = Person.new person
      model.connection = connection
      model
    end
  end

  def self.find(id, connection)
    person = connection.get("/v1/admin/people/#{id}")

    puts person.body
    model = Locale.new person.body
    model.connection = connection

    model
  end
end