require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @no_name = users(:no_name)
    @no_email = users(:no_email)
  end

  test "should_have_a_name" do
    assert_not @no_name.valid?, "name is required"
  end

  test "should_have_a_email" do
    assert_not @no_email.valid?, "email is required"
  end

end
