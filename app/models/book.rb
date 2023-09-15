class Book < ApplicationRecord
	validates :title, :desc, :price, :page, presence: true
	validates :title, uniqueness: true
	validates :user_id, presence: true

	mount_uploader :cover, CoverUploader
	has_one_attached :book_pdf

	extend FriendlyId
	friendly_id :title, use: :slugged

	has_one :publisher
	has_many :authors

	has_many :category_books
	has_many :categories, through: :category_books

	belongs_to :user

	paginates_per 9

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
