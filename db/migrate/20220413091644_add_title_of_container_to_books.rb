class AddTitleOfContainerToBooks < ActiveRecord::Migration[6.1]
  def change
  	add_column :books, :title_of_container, :string
  end
end
