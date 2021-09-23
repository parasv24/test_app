require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    test "model_has_been_created_successfully" do
        @category = Category.new(name:"sports")
        assert @category.valid?
    end
    test "category_name_is_present" do
        @category = Category.new(name:" ")
        assert_not @category.valid?
    end
    test "category_name_is_unique" do
        @category = Category.new(name:"sports")
        @category.save
        @category2 = Category.new(name:"sports")
        assert_not @category2.save
    end
    test "category_name_length" do
        @category = Category.new(name:"aa")
        assert_not @category.valid?
        @category = Category.new(name:"a" * 26)
        assert_not @category.valid?
    end
end