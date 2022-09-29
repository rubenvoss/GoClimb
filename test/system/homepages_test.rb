require "application_system_test_case"

class HomepagesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_path

    assert_selector "h3", text: "CLIMB IN NEW PLACES WITH NEW PEOPLE!"
  end
end
