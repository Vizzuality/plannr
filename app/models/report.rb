require 'csv'

class Report < ApplicationRecord
  has_many :project_reports, dependent: :destroy
  accepts_nested_attributes_for :project_reports
  has_many :projects, through: :project_reports

  attr_accessor :report_file
  validates :report_file, presence: true, on: :create

  before_create :parse_file

  private

  def parse_file
    csv = CSV.parse(report_file.read, headers: true)
    usrname_col = csv.headers[1]
    csv.headers[2, csv.headers.size-1].each do |h|
      proj_rep = ProjectReport.new(project_name: h)
      proj_rep.total_time = csv[h].compact.inject(0) do |sum, n|
        sum + (n.to_i / 5.0) if n
      end
      next if proj_rep.total_time == 0
      proj_rep.breakdown = csv[h].each_with_index.map do |val, i|
        next if !val || val.to_i == 0
        {
          email: csv[usrname_col][i],
          percentage: val.to_i,
          days: val.to_i / 5.0
        }
      end.compact
      proj_rep.project_id = Project.where("LOWER(name) like LOWER(?)", h).
        first.try(:id)
      project_reports << proj_rep
    end
  end
end
