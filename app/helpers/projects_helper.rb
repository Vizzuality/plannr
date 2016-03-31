module ProjectsHelper
  def tooltiped_span title, content=""
    content_tag(:span, title: title, data: { toggle: "tooltip" }) do
      content
    end
  end

  def add_resource resource, path
    link_to path do
      content_tag(:span, nil, class: "glyphicon glyphicon-plus",
          "aria-hidden": true, data: { toggle: "tooltip" },
          title: "Add new #{resource}")
    end
  end

  def milestones_for project
    content = content_tag :ul do
      project.milestones.each do |m|
        concat content_tag(:li, milestone_summary(m))
      end
    end
    content_tag(:a, title: "Project Milestones", class: "btn-sm btn-primary",
                tabindex: 0, role: "button",
                data: { toggle: "popover", content: content, html: true,
                trigger: "focus" }) do
      project.milestones.count.to_s
    end
  end

  def milestone_summary milestone
    txt = [milestone.name.presence || milestone.milestone_humanize,
           l(milestone.release_date),
           link_to("Edit", edit_milestone_path(milestone))]
    txt.join(" ")
  end

  def invoices_for project
    content = content_tag :ul do
      project.invoices.each do |i|
        concat content_tag(:li, invoice_summary(i))
      end
    end
    content_tag(:a, title: "Project Invoices", class: "btn-sm btn-primary",
                tabindex: 0, role: "button",
                data: { toggle: "popover", content: content, html: true,
                trigger: "focus" }) do
      project.invoices.count.to_s
    end
  end

  def invoice_summary invoice
    txt = [number_to_currency(invoice.value)]
    txt << if invoice.payed_on
        "payed on #{l(invoice.payed_on)}"
      elsif invoice.date_sent
        "sent on #{l(invoice.date_sent)} [Payment Pending]"
      else
        "to send on #{l(invoice.planned_date)}"
      end
    txt << link_to("Edit", edit_project_invoice_path(invoice.project, invoice))
    txt.join(" ")
  end
end
