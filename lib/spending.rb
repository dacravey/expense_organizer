class Spending
  attr_reader :id, :expense_id, :category_id

  define_method(:initialize) do |attributes|
    @id = attributes[:id].to_i
    @expense_id = attributes[:expense_id].to_i
    @category_id = attributes[:category_id].to_i

  end

  define_singleton_method(:all) do
    returned_spending = []
    spendings = DB.exec("SELECT * FROM expenses_categories;")
    spendings.each() do |spending|
      id = expenses_category.fetch("id").to_i()
      expense_id = expenses_categories.fetch("expense_id").to_i()
      category_id = expenses_categories.fetch("category_id").to_i()
      returned_spending.push(Spending.new({:id => id, :expense_id => expense_id, :category_id => category_id}))
    end
    returned_spending
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO expenses_categories (expense_id, category_id) VALUES (#{@expense_id}, #{@category_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end


  define_method(:==) do |another_spend|
    self.expense_id().==(another_spend.expense_id()) && self.category_id().==(another_spend.category_id())
  end


end
