class AddCategoryNumberToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :category_number, :string
  end
end
