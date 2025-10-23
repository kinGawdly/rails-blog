require "application_system_test_case"

class MaquillajesTest < ApplicationSystemTestCase
  setup do
    @maquillaje = maquillajes(:one)
  end

  test "visiting the index" do
    visit maquillajes_url
    assert_selector "h1", text: "Maquillajes"
  end

  test "should create maquillaje" do
    visit maquillajes_url
    click_on "New maquillaje"

    fill_in "Description", with: @maquillaje.description
    fill_in "Name", with: @maquillaje.name
    fill_in "Price", with: @maquillaje.price
    click_on "Create Maquillaje"

    assert_text "Maquillaje was successfully created"
    click_on "Back"
  end

  test "should update Maquillaje" do
    visit maquillaje_url(@maquillaje)
    click_on "Edit this maquillaje", match: :first

    fill_in "Description", with: @maquillaje.description
    fill_in "Name", with: @maquillaje.name
    fill_in "Price", with: @maquillaje.price
    click_on "Update Maquillaje"

    assert_text "Maquillaje was successfully updated"
    click_on "Back"
  end

  test "should destroy Maquillaje" do
    visit maquillaje_url(@maquillaje)
    accept_confirm { click_on "Destroy this maquillaje", match: :first }

    assert_text "Maquillaje was successfully destroyed"
  end
end
