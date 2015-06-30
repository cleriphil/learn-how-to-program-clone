require 'rails_helper'

describe "the add a section process" do
  it "adds a new section" do
    visit sections_path
    click_on 'Add a New Section'
    fill_in 'Title', :with => 'Learn Ruby'
    click_on 'Create Section'
    expect(page).to have_content 'Sections'
  end
  it "gives an error when no data is entered into form fields" do
    visit new_section_path
    click_on 'Create Section'
    expect(page).to have_content 'errors'
  end

end
