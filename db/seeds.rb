# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

books = [
  ["Amit Garg", "Publish News Letter", "MCA Department"],
  ["Lalit Kumar", "Client Server Computing", "Sun India Publications"],
  ["Vinay Kumar", "Mobile Computing K Nath & Sons"],
  ["Sharad Kumar", "Verma Data Structure Using C", "Thakur Publications Lucknow"],
  ["Sharad Kumar", "Verma Client Server Computing", "Sun India Publications"],
  ["Sharad Kumar", "Verma Computer Networks", "Sun India Publication"],
  ["Sharad Kumar", "Verma .NET Framework & C#", "Sun India Publication"]
]

books.each do |book|
  author_first_and_last_name = book[0].split(" ")
  Book.create!(
    title: book[1],
    author_first_name: author_first_and_last_name.first,
    author_last_name: author_first_and_last_name.last,
    publisher: book[2],
    price: 300
  )
end
