require 'test_helper'

class ReportTest < ActiveSupport::TestCase

  test "parse_file should create various objects" do
    file = Rack::Test::UploadedFile.
      new(File.open(File.join(Rails.root,
                              'test', 'fixtures', 'test_report.csv')))
    @report = Report.create(report_date: Date.today,
                            report_file: file)

    assert_equal 2, @report.project_reports.size
    assert_equal 3, @report.project_reports.map{|p| p.breakdown.size}.sum
    assert_equal 195, @report.project_reports.map(&:breakdown).
      flatten.inject(0) {|sum, t| sum + t["percentage"]}
  end
end
