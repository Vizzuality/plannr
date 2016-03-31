class OutlookController < ApplicationController

  def index
    @interval = [3.months.ago.beginning_of_month.to_date,
                 1.year.from_now.end_of_month.to_date]
    @range_of_months = range_of_months(@interval)
    @projects = Project.order(:name).
      where.not(start_date: nil, end_date: nil).
      includes([:milestones, :invoices, :project_manager])
    @per_months = calc_per_months
  end


  private

  def range_of_months interval
    start_date, end_date = interval
    range = []
    (start_date.year..end_date.year).each do |y|
      mo_start = (start_date.year == y) ? start_date.month : 1
      mo_end = (end_date.year == y) ? end_date.month : 12

      (mo_start..mo_end).each do |m|
        range << Date.parse("#{m}/#{y}")
      end
    end
    range
  end

  def calc_per_months
    vals = []
    @projects.each do |p|
      vals << [p.id, p.score]
    end
    max = vals.map{|g| g[1]}.max
    min = vals.map{|g| g[1]}.min
    vals.each do |a|
      a[1] = (((1-0.1)*(a[1]-min))/(max-min))+0.1
    end
    vals
  end
end
