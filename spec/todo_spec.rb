require('rspec')
require('todo')
require('pg')


  # describe(Todo) do
  #   before() do
  #     Todo.clear()
  #   end
  # end

  DB = PG.connect({:dbname => 'to_do_test'})

  RSpec.configure do |config|
    DB.exec("DELETE FROM todos *;")
  end


  describe(Todo) do
    describe("#description") do
      it("lets you give it a description") do
        test_todo = Todo.new({:description => "learn SQL"})
        expect(test_todo.description()).to(eq("learn SQL"))
      end
    end
  end

  describe(".all") do
    it("it is empty at first") do
      expect(Todo.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a todo to the array of saved todos") do
      test_todo = Todo.new({:description => "learn SQL"})
      test_todo.save()
      expect(Todo.all()).to(eq([test_todo]))
    end
  end

#   describe(".clear") do
#     it("empties out all of the saved todos") do
#       Todo.new("wash the lion").save()
#       Todo.clear()
#       expect(Todo.all()).to(eq([]))
#   end
# end


    describe("#==") do
      it("is the same todo if it has the same description") do
        todo1 = Todo.new({:description => "learn SQL"})
        todo2 = Todo.new({:description => "learn SQL"})
        expect(todo1).to(eq(todo2))
      end
    end
