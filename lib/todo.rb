class Todo
  attr_reader(:description)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
  end

  define_method(:description) do
    @description
  end

  define_singleton_method(:all) do
    returned_todos = DB.exec("SELECT * FROM todos;")
    todos = []
    returned_todos.each() do |todo|
      description = todo.fetch("description")
      todo.push(Todo.new({:description => description}))
    end
    todos
  end

  define_method(:save) do
    DB.exec("INSERT INTO todos (description) VALUES ('#{@description}');")
  end

  define_singleton_method(:clear) do
    @@all_todos = []
  end

  define_method(:==) do |another_task|
    self.description().==(another_task.description())
  end
end
