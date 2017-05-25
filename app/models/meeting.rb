class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  def dates_array
    dates_in_array = self.dates.split(',')
  end

  def view_dates
    dates_in_array = self.dates.split(',').join(" ")
  end
end
