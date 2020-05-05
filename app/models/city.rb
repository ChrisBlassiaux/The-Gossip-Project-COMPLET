class City < ApplicationRecord
  validates :name, presence: true, length: {in: 1..14}
  validates :zip_code, presence: true, format{with: /^(?:[0-8]\d|9[0-8])\d{3}$/, message: "Code postal français requis"}

  has_many :users
end
