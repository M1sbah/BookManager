class Book < ApplicationRecord
	validates :title, :desc, :price, :page, presence: true
	validates :title, uniqueness: true

	extend FriendlyId
	friendly_id :title, use: :slugged

	has_one :publisher
	has_many :authors

	def delete
		if self.publisher.present?
			self.publisher.destroy
		end

		if self.authors.present?
			self.authors.destroy_all
		end
	end
end
