class View

  def initialize
  end

  def print msg
    puts msg
  end

  def success msg
    puts "You successfully #{msg}"
  end

  def index collection, filter=nil
    my_proc = obj_proc collection
    collection.each.with_index(&my_proc)
  end

  def show obj
    if obj.is_a? Task
      puts obj
    else
      puts obj
      obj.tasks.each.with_index(&(obj_proc Task))
    end
  end

  def command_error cmd
    if cmd
      puts "#{cmd} is not a valid Todo command"
    else
      puts "You didn't pass any command"
    end
    puts "you can use any of the following commands:"
    puts %w(list add delete complete filter)
  end

  def obj_proc klass
    task_view = Proc.new {| task, i | puts "   #{i + 1}. ".ljust(4) + task.to_s }

    list_view = Proc.new do | list, i |
      puts "#{i + 1}. ".ljust(4) + list.to_s
      list.tasks.each.with_index(&task_view)
    end
    klass == Task ? task_view : list_view
  end
end
