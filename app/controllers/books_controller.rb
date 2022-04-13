class BooksController < ApplicationController
  def sorted_books_p_a_t
    books = Book.all
 	sorted_books = Books::Sort.new(collection: books).sort_by(['publisher', 'author_last_name', 'author_first_name', 'title'])
 	render json: sorted_books
  end

  def sorted_books_a_t
    books = Book.all
    sorted_books = Books::Sort.new(collection: books).sort_by(['author_last_name', 'author_first_name', 'title'])
    render json: sorted_books
  end

  def total_price
  	render json: { total_price: Book.sum(:price) }
  end
end
