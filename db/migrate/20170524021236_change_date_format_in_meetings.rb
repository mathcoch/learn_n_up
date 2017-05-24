class ChangeDateFormatInMeetings < ActiveRecord::Migration[5.0]
  def change
    change_column :meetings, :date, :string
  end
end
