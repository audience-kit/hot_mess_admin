class Locale < ApplicationRecord
  has_many :venues

  validates :name, presence: true, uniqueness: true
  validates :display_name, presence: true
end