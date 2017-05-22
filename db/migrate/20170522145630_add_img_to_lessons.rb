class AddImgToLessons < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :img_url, :string
  end
end
