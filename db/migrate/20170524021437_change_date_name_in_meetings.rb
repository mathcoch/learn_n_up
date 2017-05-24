class ChangeDateNameInMeetings < ActiveRecord::Migration[5.0]
  def change
    rename_column :meetings, :date, :dates
  end
end
