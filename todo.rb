require_relative 'config/application'

class Todo
  attr_reader :todo_controller
  def initialize
    @todo_controller = TodoController.new
  end


  def execute_command cmd={}
    case cmd[:cmd]
    when "list"
      todo_controller.list cmd[:first_col], cmd[:filter]
    when "create_list"
      todo_controller.create_list cmd[:filter]
    when "add"
      todo_controller.add cmd[:first_col], cmd[:args]
    when "toggle"
      todo_controller.toggle cmd[:first_col], cmd[:args].to_i
    when "delete"
      todo_controller.delete cmd[:first_col], cmd[:args].to_i
    when "filter"

    else
      return todo_controller.view.command_error cmd[:cmd]
    end
    # todo_controller.list unless cmd[:cmd] == "list"
  end


  def parse_command
    command = ARGV.first
    command, first_col, second_col = command.split(":") if command
    args = ARGV[1..-1].join(' ') if command
    {cmd: command, first_col: first_col, second_col: second_col, args: args}
  end

end


todo = Todo.new
todo.execute_command todo.parse_command
