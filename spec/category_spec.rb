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
end
