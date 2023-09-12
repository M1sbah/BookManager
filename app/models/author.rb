class Author < ApplicationRecord

  validates :name, :email, presence: true, uniqueness: true

  belongs_to :book
end
