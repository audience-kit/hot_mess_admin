
class CreatePerson
  include ActiveModel::Model

  attr_accessor :facebook_id
  validates_presence_of :facebook_id

  def model_name
    Person
  end
end