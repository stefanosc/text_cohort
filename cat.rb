require_relative 'config/application'

class CommandParser
  attr_reader :cat_controller
  def initialize
    @cat_controller = CatController.new
  end


  def execute_command cmd={}
    case cmd[:cmd]
    when "send_all"
      cat_controller.simple_send_all
    else
      return View.invalid_command cmd[:cmd]
    end
  end


  def parse_command
    command = ARGV.first
    command, first_col, second_col = command.split(":") if command
    args = ARGV[1..-1].join(' ') if command
    {cmd: command, first_col: first_col, second_col: second_col, args: args}
  end

end


parser = CommandParser.new
parser.execute_command parser.parse_command
