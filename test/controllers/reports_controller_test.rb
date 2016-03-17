require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @report = reports(:one)
  end

  test "should get index" do
    get reports_url
    assert_response :success
  end

  test "should get new" do
    get new_report_url
    assert_response :success
  end

  test "should create report" do
    file = Rack::Test::UploadedFile.
      new(File.open(File.join(Rails.root,
                              'test', 'fixtures', 'test_report.csv')))
    assert_difference('Report.count') do
      post reports_url, params: { report: {
        report_date: @report.report_date,
        report_file: file
      } }
    end

    assert_redirected_to edit_report_path(Report.last)
  end

  test "should show report" do
    get report_url(@report)
    assert_response :success
  end

  test "should get edit" do
    get edit_report_url(@report)
    assert_response :success
  end

  test "should update report" do
    patch report_url(@report), params: { report: { report_date: @report.report_date } }
    assert_redirected_to report_path(@report)
  end

  test "should destroy report" do
    assert_difference('Report.count', -1) do
      delete report_url(@report)
    end

    assert_redirected_to reports_path
  end
end
