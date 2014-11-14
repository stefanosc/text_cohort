class CatController

  DEFAULT_SUBJECT = "I love spaghetti"
  DEFAULT_MESSAGE = "I love spaghetti\nhttp://angryprincess.files.wordpress.com/2008/12/spaghetti_cat.jpg"
  DEFAULT_HTML = <<-HTML
<img src='http://angryprincess.files.wordpress.com/2008/12/spaghetti_cat.jpg'>
HTML



  # def self.list
  #   # Show entire list of cohort - AFTER MVP
  # end

  # def self.add_student
  #   # User.add_student()
  # end

  # def self.run
  #   View.print_message
  #   user_command = ARGV.first
  #   # message = ARGV.shift
  #   if user_command == "send_all"
  #       send_all
  #       View.message_sent
  #   # elsif user_command == "add"
  #   #    Email.add
  #   else
  #     View.invalid_command
  #   end
  # end

  def send_all subject=DEFAULT_SUBJECT, text=DEFAULT_MESSAGE, html=DEFAULT_HTML
    User.all.each do |user|
      Email.send(name: user.name, email: user.email, subject: subject, text: text)    # Link and send to entire cohort
    end
    View.message_sent
  end
  def simple_send_all subject=DEFAULT_SUBJECT, text=DEFAULT_MESSAGE
    User.all.each do |user|
      Email.send_message user.name, user.email, subject, text    # Link and send to entire cohort
    end
    View.message_sent
  end



end



class View
  def initialize
  end

  # def self.print_message
  #   puts "Please enter send to spaghetti cat your cohort"
  # end

  def self.message_sent
    puts "You successfully sent your email!"
  end

  def self.show_cohort
    # Show the list of the cohort
  end

  def self.invalid_command
    puts "Please enter a valid command"
  end

end
