require('rspec')
require('todo')

  describe(Todo) do
    before() do
      Todo.clear()
    end
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
    it("adds a todo to the array of saved tasks") do
      test_todo = Todo.new("wash the lion")
      test_todo.save()
      expect(Todo.all()).to(eq([test_todo]))
    end
  end

  describe(".clear") do
    it("empties out all of the saved todos") do
      Todo.new("wash the lion").save()
      Todo.clear()
      expect(Todo.all()).to(eq([]))
  end
end
