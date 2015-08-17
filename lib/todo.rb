class Todo
  attr_reader(:description, :list_id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @list_id = attributes.fetch(:list_id)
  end

  define_method(:description) do
    @description
  end

  define_singleton_method(:all) do
    returned_todos = DB.exec("SELECT * FROM todos;")
    todos = []
    returned_todos.each() do |todo|
      description = todo.fetch("description")
      list_id = todo.fetch("list_id").to_i()
      todos.push(Todo.new({:description => description, :list_id => list_id}))
    end
    todos
  end

  define_method(:save) do
    DB.exec("INSERT INTO todos (description, list_id) VALUES ('#{@description}', #{@list_id});")
  end

  define_singleton_method(:clear) do
    @@all_todos = []
  end

  define_method(:==) do |another_task|
    self.description().==(another_task.description()).&(self.list_id().==(another_task.list_id()))
  end
end
