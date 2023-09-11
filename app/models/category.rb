class Category < ApplicationRecord


	validates :name, uniqueness: true

	has_many :category_books
	has_many :books, through: :category_books


	def delete
		if self.books.present?
			self.books.each do |book|
				book.categories.destroy(self)
			end
		end
	end
end
