class Expense
  attr_reader(:id, :description, :amount, :day, :company)
  define_method(:initialize) do |attributes|
    @id = attributes.fetch(:id)
    @description = attributes.fetch(:description)
    @amount = attributes.fetch(:amount)
    @day = attributes.fetch(:day)
    @company = attributes.fetch(:company)
  end

  define_singleton_method(:all) do
    returned_expenses = []
    expenses = DB.exec("SELECT * FROM expenses;")
    expenses.each() do |expense|
      id = expense.fetch("id").to_i()
      description = expense.fetch("description")
      amount = expense.fetch("amount").to_f()
      day = expense.fetch("day")
      company = expense.fetch("company")
      returned_expenses.push(Expense.new({:id => id, :description => description, :amount => amount, :company => company, :day => day}))
    end
    returned_expenses
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO expenses (description, amount, day, company) VALUES ('#{@description}', #{@amount}, '#{@day}', '#{@company}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_expense|
    self.description().==(another_expense.description()) && self.amount.==(another_expense.amount) && self.day.==(another_expense.day) && (self.company).==(another_expense.company)
  end


end
