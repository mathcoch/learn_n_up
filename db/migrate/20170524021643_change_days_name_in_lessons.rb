class ChangeDaysNameInLessons < ActiveRecord::Migration[5.0]
  def change
    rename_column :lessons, :days, :dates
  end
end
