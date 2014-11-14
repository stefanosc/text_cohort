module Email

  def self.send_message name, email, subject, text
    RestClient.post "https://api:key-c02dd27f93b1aeca93b1e33d309bde6c"\
    "@api.mailgun.net/v2/sandbox5246945994884772a3057d2759165599.mailgun.org/messages",
    :from => "Spaghetti Cat <spaghetti.cat.forever@gmail.com>",
    :to => "#{name} <#{email}>",
    :subject => subject,
    :text => text
  end

  def self.send args
    p args[:subject]
    p args[:text]
    p args[:html]
    p args[:name]
    p args[:email]
    data = Multimap.new
    data[:from] = "Spaghetti Cat <spaghetti.cat.forever@gmail.com>"
    data[:to] = "#{args[:name]} <#{args[:email]}>"
    data[:subject] = args[:subject]
    data[:text] = args[:text]
    data[:html] = '<html>Spaghetti: <img src="cid:spaghetti_cat.jpg"></html>'
    data[:inline] = File.new(File.join("assets", "spaghetti_cat.jpg"))
    RestClient.post "https://api:key-3ax6xnjp29jd6fds4gc373sgvjxteol0"\
    "@api.mailgun.net/v2/samples.mailgun.org/messages", data
  end

end
