require 'test_helper'

class SchoolDistrictsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_districts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_district" do
    assert_difference('SchoolDistrict.count') do
      post :create, :school_district => { }
    end

    assert_redirected_to school_district_path(assigns(:school_district))
  end

  test "should show school_district" do
    get :show, :id => school_districts(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => school_districts(:one).to_param
    assert_response :success
  end

  test "should update school_district" do
    put :update, :id => school_districts(:one).to_param, :school_district => { }
    assert_redirected_to school_district_path(assigns(:school_district))
  end

  test "should destroy school_district" do
    assert_difference('SchoolDistrict.count', -1) do
      delete :destroy, :id => school_districts(:one).to_param
    end

    assert_redirected_to school_districts_path
  end
end
