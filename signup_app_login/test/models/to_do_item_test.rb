require 'test_helper'

class ToDoItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
    @to_do_item = @user.to_do_items.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @to_do_item.valid?
  end

  test "user id should be present" do
    @to_do_item.user_id = nil
    assert_not @to_do_item.valid?
  end
  
    test "content should be present" do
      @to_do_item.content = "   "
      assert_not @to_do_item.valid?
  end

  test "content should be at most 140 characters" do
    @to_do_item.content = "a" * 141
    assert_not @to_do_item.valid?
  end

end
