json.extract! @book, :price
json.name_with_id "#{@book.id} - #{@book.name}"
json.publisher do
  json.name @book.publisher.try(:name)
  json.address @book.publisher.try(:address)
end
unless @book.high_price?
  json.low_price true
end
