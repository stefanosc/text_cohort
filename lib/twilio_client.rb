module TwilioClient

  def self.send to, body
    begin
      @client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
      @client.account.messages.create({
      :from => '+16506668882',
      :to => to,
      :body => body,
      })
      puts "sent!"
    rescue Twilio::REST::RequestError => e
      puts e.message
    end
  end

end