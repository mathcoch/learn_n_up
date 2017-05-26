class AddStatusToMeetings < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :status, :string
  end
end
