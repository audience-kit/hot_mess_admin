class ApplicationModel
  include ActiveModel::Model
  include ActiveModel::Conversion

  attr_accessor :id
  attr_reader :data

  def initialize(attributes = {})
    @data = {}

    super
  end

  def persisted?
    not id.nil?
  end

end