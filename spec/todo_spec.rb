require('rspec')
require('todo')

  describe(Todo) do
    describe("#description") do
      it("lets you give it a description") do
        test_todo = Todo.new("scrub the zebra")
        expect(test_todo.description()).to(eq("scrub the zebra"))
      end
    end

  describe(".all") do
    it("it is empty at first") do
      expect(Todo.all()).to(eq([]))
    end
  end
end
