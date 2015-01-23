require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/expense_organizer")
require("./lib/category")
require("./lib/spending")
require("pg")

DB = PG.connect({:dbname => "expense_organizer"})

get("/") do
  @expenses = Expense.all()
  @categories = Category.all()
  erb(:index)
end

post("/expense") do
  description = params.fetch("description")
  amount = params.fetch("amount")
  company = params.fetch("company")
  day = params.fetch("day")
  new_expense = Expense.new({ :description => description, :amount => amount, :company => company, :id => nil, :day => day })
  new_expense.save()
  @expenses = Expense.all()
  @categories = Category.all()
  erb(:index)
end

post("/add_category") do
  type = params.fetch("type")
  new_category = Category.new({ :type => type, :id => nil })
  new_category.save()
  @categories = Category.all()
  @expenses = Expenses.all()
  erb(:index)
end

get("/expense/:id") do
  @expense = Expense.find(params.fetch("id").to_i()).
  erb(:expense)
end
