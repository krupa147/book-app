class AddPublicationYearToBooks < ActiveRecord::Migration[6.1]
  def change
  	add_column :books, :publication_year, :integer
  end
end
