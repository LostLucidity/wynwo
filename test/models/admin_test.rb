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

  test "name should not be too long" do
  	@admin.name = "a" * 51
  	assert_not @admin.valid?
  end

  test "email should be present" do
  	@admin.email = " " * 5
  	assert_not @admin.valid?
  end

  test "email should not be too long" do
  	@admin.email = "a" * 245 + "@wyncode.co"
  	assert_not @admin.valid?
  end

  test "email validation should accept valid addresses" do
  	valid_addresses = %w[user@wyncode.co USER@wyncode.co A_US-ER@wyncode.co 										 first.last@wyncode.co alice+bob@wyncode.co]
  	valid_addresses.each do |valid_address|
  		@admin.email = valid_address
  		assert @admin.valid? "#{valid_address.inspect} should be valid"
  	end
  end

  test "email validation should reject invalid addresses" do
  	invalid_addresses = %w[user@wyncode,co user_at_wyncode.co 
  												 user.name@wyncode. foo@wyn_code.co foo@wyn+code.co
  												 user@example.co]
  	invalid_addresses.each do |invalid_address|
  		@admin.email = invalid_address
  		assert_not @admin.valid? "#{invalid_address.inspect} should be invalid"
  	end
  end
end
