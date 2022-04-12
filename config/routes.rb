Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'books/index' => 'books#sorted_books_p_a_t'
  get 'books/soted_books' => 'books#sorted_books_a_t'
end
