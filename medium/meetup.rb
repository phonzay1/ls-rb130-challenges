=begin
Problem/Requirements:
- `Meetup` class

  - constructor method
    - takes 2 args: integers (year, month)

  - `day` instance method
    - takes 2 args: strings (day of week, schedule) - both should be case-insensitive
    - returns the date (year, month, day) of the given meetup as a `Date` object
    - returns `nil` if the date doesn't exist (ex. fifth Thurs of Nov 2015)
    - 'teenth' is an option for the schedule - describes a date ending in 'teenth'
    (13, 14, 15, 16, 17, 18, 19)
--------------------
Data Structure:
- year and month are Integers
- day of week and schedule are Strings
- use a collection to store information about the schedule? (i.e. year, day of week)
  - array or hash
- use a range to iterate through days of the month?
- use a hash to align days of week with their corresponding methods? (ex. Tuesday.downcase => tuesday?)
- use a hash to keep track of how many days in each month?
- `day` returns a `Date` object
--------------------
Scratch Pad:
- `Date` methods `tuesday?`, `wednesday?`, etc
- `Date#wday`
---------------------
Algorithm:
- helper method for February - 28 or 29 days depending on leap year (use `Date#leap?`)
=end

require 'date'

class Meetup
  DAYS_IN_MONTH = {
  [9, 4, 6, 11] => 30,
  [1, 3, 5, 7, 8, 10, 12] => 31
  }

  def initialize(year, month)
    @year = year
    @month = month

    if month == 2
      @days_in_month = Date.new(year).leap? ? 29 : 28
    else
      DAYS_IN_MONTH.each_key do |months|
        @days_in_month = DAYS_IN_MONTH[months] if months.include?(month)
      end
    end
  end

  def day(day_of_week, schedule)
    day_of_week = weekday_num(day_of_week.downcase)
    schedule = schedule.downcase

    if schedule == 'last'
      Date.new(year, month, determine_last_dates(day_of_week))
    elsif schedule == 'teenth'
      Date.new(year, month, determine_teenth_dates(day_of_week))
    else
      date = determine_12345_dates(day_of_week, schedule_num(schedule))
      date.nil? ? nil : Date.new(year, month, date)
    end
  end

  private

  attr_reader :year, :month, :days_in_month

  def weekday_num(day_of_week)
    case day_of_week
    when 'sunday' then 0
    when 'monday' then 1
    when 'tuesday' then 2
    when 'wednesday' then 3
    when 'thursday' then 4
    when 'friday' then 5
    when 'saturday' then 6
    end
  end

  def schedule_num(schedule)
    case schedule
    when 'first' then 1
    when 'second' then 2
    when 'third' then 3
    when 'fourth' then 4
    when 'fifth' then 5
    end
  end

  def determine_12345_dates(weekday_num, schedule_num)
    occurrences = 0
    date = nil
    1.upto(days_in_month) do |day|
      occurrences += 1 if Date.new(year, month, day).wday == weekday_num
      if occurrences == schedule_num
        date = day
        break
      end
    end
    date
  end

  def determine_last_dates(weekday_num)
    occurrences = []
    1.upto(days_in_month) do |day|
      occurrences << day if Date.new(year, month, day).wday == weekday_num
    end
    occurrences.last
  end

  def determine_teenth_dates(weekday_num)
    1.upto(days_in_month) do |day|
      if Date.new(year, month, day).wday == weekday_num &&
         (13..19).include?(day)
        break day
      end
    end
  end
end

# p Meetup.new(2023, 9).days_in_month
# p Meetup.new(2023, 2).days_in_month
# p Meetup.new(2024, 2).days_in_month
# p Meetup.new(2023, 10).days_in_month
