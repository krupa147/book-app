class AddFieldsToBooks < ActiveRecord::Migration[6.1]
  def change
  	add_column :books, :volume, :integer
  	add_column :books, :page_range, :string
  	add_column :books, :url, :string
  	add_column :books, :issue_year, :integer
  	add_column :books, :issue_month, :integer
  end
end
