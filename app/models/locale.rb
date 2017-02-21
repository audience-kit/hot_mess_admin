class Locale < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :display_name
end