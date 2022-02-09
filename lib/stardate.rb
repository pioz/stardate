require 'stardate/version'
require 'active_support/time'

module Stardate
  YEAR_O = 2323
  YEAR_DURATION = 365.2425 # Average value of a calendar year, considering the occurrence of leap years, in accordance with the inferred Stardates in Star Trek FAQ by Andrew Main

  BASE_DATE = Struct.new(:year, :stardate).new(2323, 0.0)

  def self.set_base_date_to_2023
    BASE_DATE.year = 2323
    BASE_DATE.stardate = 0.0
  end

  def self.set_base_date_to_2005
    BASE_DATE.year = 2005
    BASE_DATE.stardate = 58000.0
  end

  module STime
    def to_stardate
      t1 = self.beginning_of_year
      t2 = self.beginning_of_day
      days = (t2 - t1) / 3600 / 24 # days passed since the beginning of the year
      seconds = self - t2          # seconds passed since the beginning of the day
      (BASE_DATE.stardate + ((self.year - BASE_DATE.year) + days / YEAR_DURATION + seconds / (YEAR_DURATION * 24 * 3600)) * 1000).round(1)
    end
  end

  module SFloat
    def to_time
      y = 1000
      s = (y / YEAR_DURATION / 24 / 3600)
      stardate = self.round(1) - BASE_DATE.stardate
      year = (stardate / y).to_i
      seconds = ((stardate - (year * 1000)) / s).to_i
      Time.new(year + BASE_DATE.year) + seconds.seconds
    end
  end
end

Time.send(:include, Stardate::STime)
Float.send(:include, Stardate::SFloat)
