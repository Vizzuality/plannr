require 'test_helper'

class ProjectManagersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_manager = project_managers(:one)
  end

  test "should get index" do
    get project_managers_url
    assert_response :success
  end

  test "should get new" do
    get new_project_manager_url
    assert_response :success
  end

  test "should create project_manager" do
    assert_difference('ProjectManager.count') do
      post project_managers_url, params: {
        project_manager: { name: @project_manager.name }}
    end

    assert_redirected_to project_managers_path
  end

  test "should get edit" do
    get edit_project_manager_url(@project_manager)
    assert_response :success
  end

  test "should update project_manager" do
    patch project_manager_url(@project_manager), params: {
      project_manager: { name: @project_manager.name } }
    assert_redirected_to project_managers_path
  end

  test "should destroy project_manager" do
    assert_difference('ProjectManager.count', -1) do
      delete project_manager_url(@project_manager)
    end

    assert_redirected_to project_managers_path
  end
end
