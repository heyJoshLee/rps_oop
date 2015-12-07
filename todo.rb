class Todo
  DONE_MARKER = "X"
  UNDONE_MARKER = " "

  attr_accessor :title, :description, :done

  def initialize(title, description="")
    @title = title
    @description = description
    @done = false
  end

  def done!
      self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def size
    @todos.size
  end

  def add(item)
    raise TypeError, "can only add Todo objects" unless item.instance_of? Todo
    todos << item
  end

def <<(item)
    raise TypeError, "can only add Todo objects" unless item.instance_of? Todo
    todos << item
  end
  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_done_at(index)
    item_at(index).undone!
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def done?
    todos.all? { |item| item.done? }
  end

  def done!
    @todos.each_index do |index|
      mark_done_at(index)
    end
  end

  def remove_at(index)
    todos.delete(item_at(index))
  end

  def to_s
    text = "----- #{title} -----\n"
    todos.each { |item| puts item }
  end

  def each
    counter = 0

    while counter < @todos.length
      yield(todos[counter])
      counter += 1
    end
  end

end


# tests

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each {|todo| puts "Item: #{todo}"}

