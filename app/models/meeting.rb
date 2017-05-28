class Meeting < ApplicationRecord
  belongs_to :user
  belongs_to :lesson

  STATUS = ['pending', 'accepted', 'refused']
  validates :dates, :user, :lesson, presence: true
  validates :status, inclusion: STATUS

  # Form an array of dates in string
  def dates_array
    dates_in_array = self.dates.split(',')
  end

  # Format for Users/Show with meeting dates
  def view_dates
    dates_in_array = self.dates.split(',').join(" ")
  end
end
