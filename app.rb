require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/todo")

  get("/") do
    @todos = Todo.all()
    erb(:index)
  end

  post("/todo") do #Check if todo or todos
    description = params.fetch("description")
    todo = Todo.new(description)
    todo.save()
    erb(:success)
  end
