require "test_helper"

class MaquillajesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maquillaje = maquillajes(:one)
  end

  test "should get index" do
    get maquillajes_url
    assert_response :success
  end

  test "should get new" do
    get new_maquillaje_url
    assert_response :success
  end

  test "should create maquillaje" do
    assert_difference("Maquillaje.count") do
      post maquillajes_url, params: { maquillaje: { description: @maquillaje.description, name: @maquillaje.name, price: @maquillaje.price } }
    end

    assert_redirected_to maquillaje_url(Maquillaje.last)
  end

  test "should show maquillaje" do
    get maquillaje_url(@maquillaje)
    assert_response :success
  end

  test "should get edit" do
    get edit_maquillaje_url(@maquillaje)
    assert_response :success
  end

  test "should update maquillaje" do
    patch maquillaje_url(@maquillaje), params: { maquillaje: { description: @maquillaje.description, name: @maquillaje.name, price: @maquillaje.price } }
    assert_redirected_to maquillaje_url(@maquillaje)
  end

  test "should destroy maquillaje" do
    assert_difference("Maquillaje.count", -1) do
      delete maquillaje_url(@maquillaje)
    end

    assert_redirected_to maquillajes_url
  end
end
