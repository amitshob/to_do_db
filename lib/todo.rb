class Todo
  @@all_todos = []

  define_method(:initialize) do |description|
    @description = description
  end

  define_method(:description) do
    @description
  end

  define_singleton_method(:all) do
    @@all_todos
  end

  define_method(:save) do
    @@all_todos.push(self)
  end
end
