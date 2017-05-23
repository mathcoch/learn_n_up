class AddFieldsToLesson < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :level, :string
    add_column :lessons, :days, :string
  end
end
