class RemoveValidatedFromMeetings < ActiveRecord::Migration[5.0]
  def change
    remove_column :meetings, :validated, :boolean
  end
end
