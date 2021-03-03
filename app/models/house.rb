class House < ApplicationRecord
  has_many :stations, dependent: :destroy, inverse_of: :house
  accepts_nested_attributes_for :stations,
   reject_if: proc {|attributes| attributes['route_name'].blank? and attributes['station_name'].blank? and attributes['walking_minutes'].blank?}, allow_destroy: true
end
