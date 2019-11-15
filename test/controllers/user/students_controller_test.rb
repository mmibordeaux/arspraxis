require 'test_helper'

class User::StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_student = user_students(:one)
  end

  test "should get index" do
    get user_students_url
    assert_response :success
  end

  test "should get new" do
    get new_user_student_url
    assert_response :success
  end

  test "should create user_student" do
    assert_difference('User::Student.count') do
      post user_students_url, params: { user_student: { confirmed: @user_student.confirmed, program_group_id: @user_student.program_group_id, user_id: @user_student.user_id } }
    end

    assert_redirected_to user_student_url(User::Student.last)
  end

  test "should show user_student" do
    get user_student_url(@user_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_student_url(@user_student)
    assert_response :success
  end

  test "should update user_student" do
    patch user_student_url(@user_student), params: { user_student: { confirmed: @user_student.confirmed, program_group_id: @user_student.program_group_id, user_id: @user_student.user_id } }
    assert_redirected_to user_student_url(@user_student)
  end

  test "should destroy user_student" do
    assert_difference('User::Student.count', -1) do
      delete user_student_url(@user_student)
    end

    assert_redirected_to user_students_url
  end
end
