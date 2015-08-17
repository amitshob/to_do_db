require('rspec')
require('todo')
require('pg')


  # describe(Todo) do
  #   before() do
  #     Todo.clear()
  #   end
  # end

  DB = PG.connect({:dbname => 'to_do_test'})

  Rspec.configure do |config|
    DB.exec("DELETE FROM todos *;")
  end


  describe(Todo) do
    describe("#description") do
      it("lets you give it a description") do
        test_todo = Todo.new("scrub the zebra")
        expect(test_todo.description()).to(eq("scrub the zebra"))
      end
    end
  end

  describe(".all") do
    it("it is empty at first") do
      expect(Todo.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "learn SQL"})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
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
end
