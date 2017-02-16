class Locale < ApplicationRecord
  has_many :venues
  has_many :people

  validates :name, presence: true, uniqueness: true
  validates :display_name, presence: true
end