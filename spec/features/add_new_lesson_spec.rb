require 'rails_helper'

describe "the add a lesson process" do
  it "adds a new lesson" do
    test_section = Section.create(:title => "Section One")


    visit section_path(test_section)
    click_on 'Add a New Lesson'
    fill_in 'Name', :with => 'Ruby'
    fill_in 'Content', :with => 'Blah Blah'
    fill_in 'Number', :with => 1
    click_on 'Create Lesson'
    expect(page).to have_content 'Lessons'

  end

  # it "gives an error when no data is entered into form fields" do
  #   visit new_lesson_path
  #   click_on 'Create Lesson'
  #   expect(page).to have_content 'errors'
  # end
end
