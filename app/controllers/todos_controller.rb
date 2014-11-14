class TodoController

  attr_reader  :view

  def initialize
    @view = View.new
  end

  def list id=nil, i=nil
    view.index List.all
     # todo_list.select_tasks(filter)
  end

  def add task_name
    task = Task.create(name: task_name)
    view.success "added your task '#{task.name}' to your TODO list"
  end

  def delete task_id
    if task = Task.all[task_id-1]
      task.destroy
      view.success "deleted '#{task.name}' from your TODO list"
    else
      puts "we could not find a task with id #{task_id}"
    end
  end

  def toggle task_id
    if task = Task.all[task_id-1]
      task.toggle(:complete)
      task.save
      view.success "completed task #{task}"
    else
      puts "we could not find a task with id #{task_id}"
    end
  end

 end
