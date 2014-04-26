require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { city: @user.city, college: @user.college, college_degree: @user.college_degree, company: @user.company, department: @user.department, email: @user.email, favorite_artist: @user.favorite_artist, favorite_food: @user.favorite_food, first_name: @user.first_name, join_date: @user.join_date, last_movie_seen: @user.last_movie_seen, last_name: @user.last_name, middle_initial: @user.middle_initial, phone: @user.phone, photo_path: @user.photo_path, state: @user.state, street1: @user.street1, street2: @user.street2, title: @user.title, twitter_user_name: @user.twitter_user_name, website: @user.website, zip: @user.zip }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { city: @user.city, college: @user.college, college_degree: @user.college_degree, company: @user.company, department: @user.department, email: @user.email, favorite_artist: @user.favorite_artist, favorite_food: @user.favorite_food, first_name: @user.first_name, join_date: @user.join_date, last_movie_seen: @user.last_movie_seen, last_name: @user.last_name, middle_initial: @user.middle_initial, phone: @user.phone, photo_path: @user.photo_path, state: @user.state, street1: @user.street1, street2: @user.street2, title: @user.title, twitter_user_name: @user.twitter_user_name, website: @user.website, zip: @user.zip }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
