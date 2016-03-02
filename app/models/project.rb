class Project < ActiveRecord::Base

  def status_for date
    if end_date.beginning_of_month <= date
      "finished"
    elsif start_date.beginning_of_month <= date
      "underway"
    else
      "not-started"
    end
  end
end
