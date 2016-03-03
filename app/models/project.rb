class Project < ActiveRecord::Base

  def status_for date
    if (start_date && start_date.beginning_of_month <= date) &&
        !(end_date && end_date.beginning_of_month <= date)
      "underway"
    end
  end
end
