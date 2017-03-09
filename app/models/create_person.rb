
class CreatePerson
  include ActiveModel::Model

  attr_accessor :facebook_id
  validates_presence_of :facebook_id

  def to_model
    unless self.valid?
      Rails.logger.info "Validation errors => #{self.errors.inspect}"
      return HotMessModels::Person.new
    end

    @graph = Koala::Facebook::API.new HotMessModels::User.find_by(email_address: 'rickmark@outlook.com').facebook_token

    Rails.logger.info "Reading graph for #{self.facebook_id}"
    facebook_graph = @graph.get_object self.facebook_id

    HotMessModels::Person.new facebook_id: facebook_graph['id'],
                              facebook_graph: facebook_graph,
                              name: facebook_graph['name'],
                              facebook_updated_at: DateTime.now
  end
end