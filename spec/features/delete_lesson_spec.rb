require 'rails_helper'

describe "the delete lesson process" do
  it "deletes a lesson" do
    test_section = Section.create(:title => "Java")
    test_lesson = Lesson.create(:name => "1", :content => "blah", :number => 1, :section_id => test_section.id)
    visit section_lesson_path(test_section,test_lesson)
    click_on 'Delete'
    expect(page).to have_no_content 'Rat'
  end
end
