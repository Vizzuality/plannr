require 'test_helper'

class MilestonesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @milestone = milestones(:one)
    @project = projects(:one)
  end

  test "should get index" do
    get milestones_url
    assert_response :success
  end

  test "should get new" do
    get new_project_milestone_url(@project)
    assert_response :success
  end

  test "should create milestone" do
    assert_difference('Milestone.count') do
      post project_milestones_url(@project), params: {
        milestone: { milestone: @milestone.milestone, name: @milestone.name,
                     release_date: @milestone.release_date } }
    end

    assert_redirected_to projects_path
  end

  test "should get edit" do
    get edit_milestone_url(@milestone)
    assert_response :success
  end

  test "should update milestone" do
    patch project_milestone_url(@project, @milestone), {
      milestone: {
        milestone: @milestone.milestone,
        name: @milestone.name, project_id: @milestone.project_id,
        release_date: @milestone.release_date } }
    assert_redirected_to projects_path
  end

  test "should destroy milestone" do
    assert_difference('Milestone.count', -1) do
      delete milestone_url(@milestone)
    end

    assert_redirected_to projects_path
  end
end
