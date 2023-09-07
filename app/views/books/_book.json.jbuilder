json.extract! book, :id, :title, :desc, :price, :page, :created_at, :updated_at
json.url book_url(book, format: :json)
