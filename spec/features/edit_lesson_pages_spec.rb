require 'rails_helper'

describe "the edit lesson process" do
  it "updates a lesson" do
    test_section = Section.create(:title => "Java")
    test_lesson = Lesson.create(:name => "1", :content => "blah", :number => 1, :section_id => test_section.id)
    visit section_lesson_path(test_section, test_lesson)
    click_on 'Edit'
    fill_in 'Name', :with => 'Rat'
    fill_in 'Content', :with => 'Ratty'
    fill_in 'Number', :with => 2
    click_on 'Update Lesson'
    expect(page).to have_content 'Rat'
  end

  it "gives an error when no data is entered into form fields" do
    test_section = Section.create(:title => "Java")
    test_lesson = Lesson.create(:name => "ruby", :content => "blah", :number => 2)
    visit edit_section_lesson_path(test_section, test_lesson)
    fill_in 'Name', :with => ''
    click_on 'Update Lesson'
    expect(page).to have_content 'errors'
  end
end
