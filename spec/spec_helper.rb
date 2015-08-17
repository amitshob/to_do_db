require("rspec")
require("pg")
require("list")
require("todo")



RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM lists *;")
    DB.exec("DELETE FROM todos *;")
  end
end
