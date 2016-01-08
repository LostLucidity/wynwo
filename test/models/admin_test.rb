require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  
  def setup
  	@admin = Admin.new(name: "Example User", email: "admin@wyncode.co")
  end

  test "should be valid" do
  	assert @admin.valid?
  end
end
