require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  
  def setup
  	@admin = Admin.new(name: "Example User", email: "admin@wyncode.co")
  end

  test "should be valid" do
  	assert @admin.valid?
  end

  test "name should be present" do
  	@admin.name = " " * 5
  	assert_not @admin.valid?
  end

  test "email should be present" do
  	@admin.email = " " * 5
  	assert_not @admin.valid?
  end
end
