json.books Book.all do |book|
  json.extract! book, :id, :name, :price, :created_at
  json.publisher do
    json.name book.publisher.try(:name)
    json.address book.publisher.try(:address)
  end
end
