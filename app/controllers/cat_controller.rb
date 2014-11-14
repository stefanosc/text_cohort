class CatController

  def self.list
    # Show entire list of cohort - AFTER MVP
  end

  def self.add_student
    # User.add_student()
  end

  def self.run
    View.print_message
    user_command = ARGV
    # message = ARGV.shift
    if user_command == "send"
        User.send     # Link and send to entire cohort
        View.message_sent
    elsif user_command == "add"
    else
      View.invalid_command
    end
  end
 end



class View
  def initialize
  end

  def self.print_message
    "Please enter send to spaghetti cat your cohort"
  end

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

CatController.run
