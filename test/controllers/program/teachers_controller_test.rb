require 'test_helper'

class Program::TeachersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program_teacher = program_teachers(:one)
  end

  test "should get index" do
    get program_teachers_url
    assert_response :success
  end

  test "should get new" do
    get new_program_teacher_url
    assert_response :success
  end

  test "should create program_teacher" do
    assert_difference('Program::Teacher.count') do
      post program_teachers_url, params: { program_teacher: { details: @program_teacher.details, program_id: @program_teacher.program_id, role: @program_teacher.role, user_id: @program_teacher.user_id } }
    end

    assert_redirected_to program_teacher_url(Program::Teacher.last)
  end

  test "should show program_teacher" do
    get program_teacher_url(@program_teacher)
    assert_response :success
  end

  test "should get edit" do
    get edit_program_teacher_url(@program_teacher)
    assert_response :success
  end

  test "should update program_teacher" do
    patch program_teacher_url(@program_teacher), params: { program_teacher: { details: @program_teacher.details, program_id: @program_teacher.program_id, role: @program_teacher.role, user_id: @program_teacher.user_id } }
    assert_redirected_to program_teacher_url(@program_teacher)
  end

  test "should destroy program_teacher" do
    assert_difference('Program::Teacher.count', -1) do
      delete program_teacher_url(@program_teacher)
    end

    assert_redirected_to program_teachers_url
  end
end
