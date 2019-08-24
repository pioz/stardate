require 'stardate/version'
require 'active_support/time'

module Stardate
  # Average value of a calendar year, considering the occurrence of leap
  # years, in accordance with the inferred Stardates in Star Trek FAQ by
  # Andrew Main
  YEAR_O = 2323
  YEAR_DURATION = 365.2425

  module STime
    def to_stardate
      t1 = self.beginning_of_year
      t2 = self.beginning_of_day
      days = (t2 - t1) / 3600 / 24 # days passed since the beginning of the year
      seconds = self - t2          # seconds passed since the beginning of the day
      ((self.year - YEAR_O) + days / YEAR_DURATION + seconds / (YEAR_DURATION * 24 * 3600)) * 1000
    end
  end

  module SFloat
    def to_time
      y = 1000
      s = y / YEAR_DURATION / 24 / 3600
      year = (self / y).to_i
      seconds = ((self - (year * 1000)) / s).to_i
      Time.zone.new(year + YEAR_O) + seconds.seconds
    end
  end
end

Time.send(:include, Stardate::STime)
Float.send(:include, Stardate::SFloat)
