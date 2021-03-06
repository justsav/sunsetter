module ApplicationHelper
  def self.converted_time(date)
    date.strftime("%l:%M%p").strip
  end

  def self.parse_day(date)
    Date.parse(date).strftime("%A, %e %b")
  end

  def self.convert_day(date)
    date.strftime("%A, %e %B")
  end
end

