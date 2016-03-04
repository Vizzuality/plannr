class Project < ActiveRecord::Base

  has_many :milestones
  has_many :invoices

  def status_for date
    return nil unless start_date
    return "underway" if !end_date && start_date <= date

    if start_date.beginning_of_month <= date && end_date.end_of_month >= date
      "underway"
    end
  end

  def budget_per_month
    return 0 unless budget
    budget / [((end_date.year * 12 + end_date.month) -
               (start_date.year * 12 + start_date.month)),1].max
  end
end
