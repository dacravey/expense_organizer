require('spec_helper')

describe(Spending) do
  describe('.all') do
    it("empty at first") do
      expect(Spending.all).to eq []
    end
  end

  describe('.==') do
    it("returns true if id and expense_id and category_id are equal") do
      test_spending = Spending.new({:expense_id => 2, :category_id => 2})
      test_spending.save()
      test_spending2 = Spending.new({:expense_id => 2, :category_id => 2})
      test_spending2.save()
      expect(test_spending).to eq test_spending2
    end
  end
end
