class RemoveRefusedFromMeetings < ActiveRecord::Migration[5.0]
  def change
    remove_column :meetings, :refused, :boolean
  end
end
