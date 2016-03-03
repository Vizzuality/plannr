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

  def display_invoice invoice
    txt = "#{number_to_currency(invoice.value)}"
    txt += if invoice.date_sent
        " sent on #{invoice.date_sent}"
      else
        " to send on #{invoice.planned_date}"
      end
    txt += tag(:br)
    txt += link_to("Edit", edit_project_invoice_path(invoice.project, invoice),
                   role: "button", class: "btn-sm btn-default")

    content_tag(:a, title: invoice.name, class: "btn-sm btn-primary",
                tabindex: 0, role: "button",
                data: { toggle: "popover", content: txt, html: true,
                trigger: "focus" }) do
      invoice.name
    end
  end
end
