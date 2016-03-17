require 'test_helper'

class InvoicesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
    @invoice = invoices(:one)
  end

  test "should get new" do
    get new_project_invoice_url(@project.id)
    assert_response :success
  end

  test "should create invoice" do
    assert_difference('Invoice.count') do
      post project_invoices_url(@project), params: {
        invoice: { date_sent: @invoice.date_sent, name: @invoice.name,
                   planned_date: @invoice.planned_date } }
    end

    assert_redirected_to projects_path
  end

  test "should get edit" do
    get edit_project_invoice_url(@project, @invoice)
    assert_response :success
  end

  test "should update invoice" do
    patch project_invoice_url(@project, @invoice), params: {
      invoice: {
        date_sent: @invoice.date_sent, name: @invoice.name,
        planned_date: @invoice.planned_date, project_id: @invoice.project_id }}
    assert_redirected_to projects_path
  end

  test "should destroy invoice" do
    assert_difference('Invoice.count', -1) do
      delete project_invoice_url(@project, @invoice)
    end

    assert_redirected_to projects_path
  end
end
