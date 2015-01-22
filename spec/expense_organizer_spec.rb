require("spec_helper")

describe(Expense) do
  describe(".all") do
    it ("returns no expenses at first") do
      expect(Expense.all()).to eq([])
    end
  end

  describe("#==") do
    it("returns true if name and id are the same") do
      expense1 = Expense.new({:id => nil, :description => "lunch", :amount => 12.95, :company => "Mr Taco", :day => '2015-06-24'})
      expense2 = Expense.new({:id => nil, :description => "lunch", :amount => 12.95, :company => "Mr Taco", :day => '2015-06-24'})
      expect(expense1).to eq(expense2)
    end
  end

  describe("#save") do
    it("saves an expense to the expenses table") do
      test_expense = Expense.new({:id => nil, :description => "lunch", :amount => 12.95, :company => "Mr Taco", :day => '2015-06-24'})
      test_expense.save()
      expect(Expense.all()).to eq([test_expense])
    end
  end

  describe("#find") do
    it("returns an expense by its id number") do
      test_expense = Expense.new({:id => nil, :description => "lunch", :amount => 12.95, :company => "Mr Taco", :day => '2015-06-24'})
      test_expense.save()
      test_expense2 = Expense.new(:id => nil, :description => "lunch", :amount => 12.95, :company => "Mr Taco", :day => '2015-06-24')
      test_expense2.save()
      expect(Expense.find(test_expense.id())).to(eq(test_expense))
    end
  end


end
