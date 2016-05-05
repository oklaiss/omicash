require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "the truth" do
    assert true
  end

  test "should get new" do
    get :new
    assert_response(200)
  end

end
