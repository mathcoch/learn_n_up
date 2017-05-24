class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  def dates_array
    dates_in_array = JSON.parse(self.dates)
  end

  def view_dates
    dates_in_array = JSON.parse(self.dates).join(" ")
  end
end
