class House < ApplicationRecord
  has_many :stations, dependent: :destroy, inverse_of: :house
  accepts_nested_attributes_for :stations, allow_destroy: true
end
