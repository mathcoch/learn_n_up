class Lesson < ApplicationRecord
  belongs_to :user
  has_many :meetings, dependent: :destroy
  after_validation :geocode, if: :address_changed?
  geocoded_by :address
  include AlgoliaSearch

  algoliasearch do
    attribute :name, :category, :description
  end

  CATEGORIES = ['Music', 'Language', 'Science', 'Culture', 'Entrepreneurship', 'Sport', 'Finance']
  LEVELS = ['Beginner', 'Advanced', 'Pro']
  DURATION = (0..8)

  validates :name, :description, :user, :address, presence: true
  validates :category, inclusion: CATEGORIES
  validates :level, inclusion: LEVELS
  validates :duration, inclusion: DURATION

  def category_number
    CATEGORIES.index(self.category) + 1
  end

  def params_for_datepicker
    dates_in_array = JSON.parse(self.dates)

    if dates_in_array.empty?
      date = DateTime.now.strftime('%m/%d/%Y')
      return {start_date: date, end_date: date, dates_disabled: date, alert: 'no availabilities'}
    else
      start_date = dates_in_array.first
      end_date =  dates_in_array.last

      start = Date.strptime(start_date, '%m/%d/%Y')
      stop = Date.strptime(end_date, '%m/%d/%Y')
      dates_range = (start .. stop).map{ |day| day.strftime("%m/%d/%Y").squeeze(' ') }
      dates_disabled = dates_range - dates_in_array

      dates_disabled.map { |date| "#{date}" }

      return {start_date: start_date, end_date: end_date, dates_disabled: dates_disabled, alert: 'ok'}
    end
  end
end
