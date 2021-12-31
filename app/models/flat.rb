class Flat < ApplicationRecord

  validates :name, :address, :description, :price_per_night, :number_of_guest, presence: true
  validates :number_of_guest, inclusion: { in: 1..25 }
  validates :price_per_night, inclusion: { in: 1000..100000 }
end
