class SendMessage
  def initialize(name, date, location, number, booking_id)
    @name = name
    @date = date
    @location = location
    @number = number
    @booking_id = booking_id
  end

  def send
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    message = @client.messages
    .create(
       body: "Your friend, #{@name} invited you to watch the sunset at #{@location} on #{ApplicationHelper.convert_day(@date)}. Take a look at http://www.sunsetter.site/bookings/#{@booking_id}?date_session=#{@date}",
       from: '+13074595063',
       to: '+' + @number
     )
  rescue Twilio::REST::TwilioError => e
    puts e.message
  end
end
