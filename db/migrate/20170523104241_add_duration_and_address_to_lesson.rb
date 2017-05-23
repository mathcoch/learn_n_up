class AddDurationAndAddressToLesson < ActiveRecord::Migration[5.0]
  def change
    add_column :lessons, :duration, :integer
    add_column :lessons, :address, :string
    add_column :lessons, :city, :string
  end
end
