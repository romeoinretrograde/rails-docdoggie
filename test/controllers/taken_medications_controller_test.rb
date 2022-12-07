require "test_helper"

class TakenMedicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get taken_medications_new_url
    assert_response :success
  end

  test "should get create" do
    get taken_medications_create_url
    assert_response :success
  end
end
