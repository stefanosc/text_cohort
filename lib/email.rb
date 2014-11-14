module Email

  def self.send name, email, subject, text
    RestClient.post "https://api:key-c02dd27f93b1aeca93b1e33d309bde6c"\
    "@api.mailgun.net/v2/sandbox5246945994884772a3057d2759165599.mailgun.org/messages",
    :from => "Spaghetti Cat <spaghetti.cat.forever@gmail.com>",
    :to => "#{name} <#{email}>",
    :subject => subject,
    :text => text
  end

end
