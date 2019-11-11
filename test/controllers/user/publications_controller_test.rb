require 'test_helper'

class User::PublicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_publication = user_publications(:one)
  end

  test "should get index" do
    get user_publications_url
    assert_response :success
  end

  test "should get new" do
    get new_user_publication_url
    assert_response :success
  end

  test "should create user_publication" do
    assert_difference('User::Publication.count') do
      post user_publications_url, params: { user_publication: { content: @user_publication.content, group_id: @user_publication.group_id, published: @user_publication.published, title: @user_publication.title, user_id: @user_publication.user_id } }
    end

    assert_redirected_to user_publication_url(User::Publication.last)
  end

  test "should show user_publication" do
    get user_publication_url(@user_publication)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_publication_url(@user_publication)
    assert_response :success
  end

  test "should update user_publication" do
    patch user_publication_url(@user_publication), params: { user_publication: { content: @user_publication.content, group_id: @user_publication.group_id, published: @user_publication.published, title: @user_publication.title, user_id: @user_publication.user_id } }
    assert_redirected_to user_publication_url(@user_publication)
  end

  test "should destroy user_publication" do
    assert_difference('User::Publication.count', -1) do
      delete user_publication_url(@user_publication)
    end

    assert_redirected_to user_publications_url
  end
end
