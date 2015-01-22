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

  define_method(:save) do
    result = DB.exec("INSERT INTO categories (type) VALUES ('#{@type}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_category|
    self.type().==(another_category.type())
  end

  define_singleton_method(:find) do |id|
    Category.all().each do |category|
      if(category.id() == id)
        @found_category = category
      end
    end
    @found_category
  end


end
