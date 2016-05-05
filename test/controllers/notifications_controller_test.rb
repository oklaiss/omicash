require 'test_helper'

class NotificationsControllerTest < ActionController::TestCase
  setup do
    @notification = notifications(:one)
  end

  test "should get index" do
    get :index
    assert_response(302)
  end

  test "should get new" do
    get :new
    assert_response(302)
  end

  test "should create notification" do
    assert_difference('Notification.count', 0) do
      post :create, notification: { duration: @notification.duration, email: @notification.email, frequency: @notification.frequency, is_active: @notification.is_active, last_sent: @notification.last_sent, message_text: @notification.message_text, name: @notification.name, phone_number: @notification.phone_number, user_id: @notification.user_id }
    end

    # assert_redirected_to notification_path(assigns(:notification))
  end

  test "should show notification" do
    get :show, id: @notification
    assert_response(302)
  end

  test "should get edit" do
    get :edit, id: @notification
    assert_response(302)
  end

  test "should update notification" do
    patch :update, id: @notification, notification: { duration: @notification.duration, email: @notification.email, frequency: @notification.frequency, is_active: @notification.is_active, last_sent: @notification.last_sent, message_text: @notification.message_text, name: @notification.name, phone_number: @notification.phone_number, user_id: @notification.user_id }
    # assert_redirected_to notification_path(assigns(:notification))
    assert_redirected_to "http://test.host/login"
  end

  test "should destroy notification" do
    assert_difference('Notification.count', 0) do
      delete :destroy, id: @notification
      assert_redirected_to login_path
    end

    assert_redirected_to "http://test.host/login"
  end
end
