# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

books = [
  ["MCA Department", "Publish News Letter", "Garg", "Amit"],
  ["Sun India Publications", "Client Server Computing", "Lalit", "Kumar"],
  ["Thakur Publications Lucknow", "Mobile Computing K Nath & Sons", "Vinay", "Kumar"],
  ["Thakur Publications Lucknow", "Data Structure Using C", "Sharad", "Kumar"],
  ["Sun India Publications", "Client Server Computing", "Sharad", "Kumar"],
  ["Sun India Publication", "Computer Networks", "Sharad", "Kumar"],
  ["Sun India Publication", ".NET Framework & C#", "Sharad", "Kumar"]
]

columns = ["publisher", "title", "author_last_name", "author_first_name", "price","title_of_container","publication_year", "volume", "page_range", "url","issue_year","issue_month"]

# books.each do |book|
#   author_first_and_last_name = book[0].split(" ")
#   Book.create!(
#     title: book[1],
#     author_first_name: author_first_and_last_name.first,
#     author_last_name: author_first_and_last_name.last,
#     publisher: book[2],
#     price: 300
#   )
# end

books.map! do |book|
  book + [100, "Jounal", 2001, 2, "206-211", "www.book.com", 2021, 1 ]
end

Book.import columns, books
