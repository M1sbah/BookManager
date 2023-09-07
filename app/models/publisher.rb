class Publisher < ApplicationRecord
  belongs_to :book

  validates :address , presence: true , length: {minimum: 4, maximum: 40}
end
