module OutlookHelper
  def table_cell_for project, date, current_month, &block
    classes = []
    classes << "current" if current_month
    classes << "bdev" unless project.live?
    title = project.start_date && status_for(project, date)
    classes << title
    content_tag(:td, title: title, class: classes.join(" ")) do
      yield
    end
  end

  def status_for project, date
    return nil if project.end_date && project.end_date.beginning_of_week < date
    next_milestone = project.next_milestone_from(date)
    if next_milestone
      next_milestone.milestone_humanize.downcase
    else
      "close-it-off"
    end
  end
end
