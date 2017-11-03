require 'test_helper'

class ElementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @element = elements(:one)
  end

  test "should get index" do
    get elements_url
    assert_response :success
  end

  test "should get new" do
    get new_element_url
    assert_response :success
  end

  test "should create element" do
    assert_difference('Element.count') do
      post elements_url, params: { element: { column_id: @element.column_id, item_id: @element.item_id, table_id: @element.table_id, value: @element.value } }
    end

    assert_redirected_to element_url(Element.last)
  end

  test "should show element" do
    get element_url(@element)
    assert_response :success
  end

  test "should get edit" do
    get edit_element_url(@element)
    assert_response :success
  end

  test "should update element" do
    patch element_url(@element), params: { element: { column_id: @element.column_id, item_id: @element.item_id, table_id: @element.table_id, value: @element.value } }
    assert_redirected_to element_url(@element)
  end

  test "should destroy element" do
    assert_difference('Element.count', -1) do
      delete element_url(@element)
    end

    assert_redirected_to elements_url
  end
end