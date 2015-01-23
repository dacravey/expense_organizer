class Category
  attr_reader :id, :type

  define_method(:initialize) do |attributes|
    @id = attributes[:id]
    @type = attributes[:type]
  end

  define_singleton_method (:all) do
    returned_categories = []
    categories = DB.exec("SELECT * FROM categories;")
    categories.each() do |category|
      id = category.fetch("id").to_i()
      type = category.fetch("type")
      returned_categories.push(Category.new({:id => id, :type => type}))
    end
    returned_categories
  end

  define_singleton_method(:find) do |id|
    Category.all().each do |category|
      if(category.id() == id)
        @found_category = category
      end
    end
    @found_category
  end


  define_method(:save) do
    result = DB.exec("INSERT INTO categories (type) VALUES ('#{@type}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_category|
    self.type().==(another_category.type())
  end

  define_method(:percentage_by_category) do

  end

  define_method(:percentage_spending_by_category) do
    id1 = self.id
    total_by_category = 0;
    grand_total =0;
    percentage = 0;
    result = DB.exec("SELECT expenses.* FROM
    categories JOIN expenses_categories ON (categories.id = expenses_categories.category_id)
    JOIN expenses ON (expenses_categories.expense_id = expenses.id)
    WHERE #{@id} = expenses_categories.category_id;")

    array_of_expenses = Expense.all()

    array_of_expenses.each do |expense|
      grand_total += expense.amount
    end

    result.each() do |expense|
      total_by_category += expense.fetch("amount").to_f
    end
    percentage = total_by_category/grand_total

  end



end
