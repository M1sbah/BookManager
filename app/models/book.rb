class Book < ApplicationRecord
	validates :title, :desc, :price, :page, presence: true
	validates :title, uniqueness: true

	extend FriendlyId
	friendly_id :title, use: :slugged

	has_one :publisher
	has_many :authors

	has_many :category_books
	has_many :categories, through: :category_books

	def delete
		if self.publisher.present?
			self.publisher.destroy
		end

		if self.authors.present?
			self.authors.destroy_all
		end
		if self.categories.present?
			self.categories.each do |category|
				category.books.destroy(self)
			end
		end
	end
end
