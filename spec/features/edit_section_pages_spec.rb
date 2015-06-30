require 'rails_helper'

describe "the edit section process" do
  # it "shows a section" do
  #   visit sections_path
  #   click_on 'Add a New Section'
  #   fill_in 'Title', :with => 'Mice'
  #   click_on 'Create Section'
  #   click_on 'Mice'
  #   expect(page).to have_content 'Mice'
  # end

  it "updates a section" do
    visit sections_path
    click_on 'Add a New Section'
    fill_in 'Title', :with => 'Mice'
    click_on 'Create Section'
    click_on 'Mice'
    click_on 'Edit Section'
    fill_in 'Title', :with => 'Rat'
    click_on 'Update Section'
    expect(page).to have_content 'Rat'
  end

  it "gives an error when no data is entered into form fields" do
    test_section = Section.create(:title => "ruby")
    visit edit_section_path(test_section)
    fill_in 'Title', :with => ''
    click_on 'Update Section'
    expect(page).to have_content 'errors'
  end
end
