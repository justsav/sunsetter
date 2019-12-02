# class SendMessage
#   def initialize
#     @name = name
#     @date = date
#     @location = location
#   end

#   def send
#     account_sid = 'AC42ff329b2c7db569645d9ba9bae25143'
#     auth_token = '26ddc462f2942a016eadf13cbf6569bb'
#     @client = Twilio::REST::Client.new(account_sid, auth_token)

#     message = @client.messages
#     .create(
#        body: "This is the ship that made the Kessel Run in fourteen parsecs? Take a look at http://www.sunsetter.site",
#        from: '+13074595063',
#        to: '+447384564080'
#      )
#   end
# end



# Download the helper library from https://www.twilio.com/docs/ruby/install

# Your Account Sid and Auth Token from twilio.com/console
# DANGER! This is insecure. See http://twil.io/secure




