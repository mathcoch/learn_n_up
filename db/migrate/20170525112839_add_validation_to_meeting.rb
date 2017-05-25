class AddValidationToMeeting < ActiveRecord::Migration[5.0]
  def change
    add_column :meetings, :validated, :boolean, default: false
    add_column :meetings, :refused, :boolean, default: false
  end
end
