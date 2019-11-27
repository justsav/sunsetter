module ApplicationHelper
  def self.converted_time(date)
    date.strftime("%I:%M%p")
  end
end


