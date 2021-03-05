class House < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :rent,  presence: true, numericality: { greater_than: 0}
  validates :adress,  presence: true, length: { maximum: 30 }
  validates :age,  presence: true, numericality: { greater_than_or_equal_to: 0}
  has_many :stations, dependent: :destroy
  accepts_nested_attributes_for :stations,
   reject_if: :all_blank, allow_destroy: true
end
