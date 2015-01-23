require('spec_helper')

describe(Category) do
  describe(".all") do
      it("returns empty at first") do
        expect(Category.all).to eq []

      end

  end

#  category1 = Category.new({:id => nil, :type => "Fast Food"})

  describe("#find") do
    it("returns a category by its id number") do
      test_category = Category.new({:id => nil, :type => "Fast Food"})
      test_category.save()
      test_category2 = Category.new({:id => nil, :type => "Fast Food"})
      test_category2.save()
      expect(Category.find(test_category.id())).to(eq(test_category))
    end
  end

  describe("#percentage_spending_by_category") do
    it("returns the total amount that was spent in category") do
      test_category = Category.new({:id => nil, :type => "lunch"})
      test_category.save()
      expense = Expense.new({:id => nil, :description => "eat out", :amount => 12.50, :company => "Mr Taco", :day => '2015-06-24'})
      expense2 = Expense.new({:id => nil, :description => "eat out", :amount => 7.50, :company => "Subway", :day => '2015-06-28'})
      expense3 = Expense.new({:id => nil, :description => "eat out", :amount => 7.50, :company => "Subway", :day => '2015-06-28'})
      expense.save()
      expense2.save()
      expense3.save()
      spending1 = Spending.new(:id => nil, :expense_id => expense.id, :category_id => test_category.id)
      spending1.save()
      spending2 = Spending.new(:id => nil, :expense_id => expense2.id, :category_id => test_category.id)
      spending2.save()
      total = test_category.percentage_spending_by_category()
      expect(total).to eq 20
    end
  end
end
