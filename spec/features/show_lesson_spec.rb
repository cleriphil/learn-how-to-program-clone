require 'rails_helper'

describe "the consecutive lesson links" do
  it "goes to the next lesson" do
    test_section = Section.create(:title => "Java")
    Lesson.create(:name => "2", :content => "blah", :number => 2, :section_id => test_section.id)
    Lesson.create(:name => "3", :content => "blah", :number => 3, :section_id => test_section.id)
    Lesson.create(:name => "4", :content => "blah", :number => 4, :section_id => test_section.id)
    test_lesson = Lesson.create(:name => "1", :content => "blah", :number => 1, :section_id => test_section.id)
    visit section_lesson_path(test_section, test_lesson)
    click_on 'Next'
    expect(page).to have_content '2'
  end
  it "goes to the previous lesson" do
  test_section = Section.create(:title => "Java")
    Lesson.create(:name => "2", :content => "blah", :number => 2, :section_id => test_section.id)
    Lesson.create(:name => "3", :content => "blah", :number => 3, :section_id => test_section.id)
    Lesson.create(:name => "4", :content => "blah", :number => 4, :section_id => test_section.id)
    test_lesson = Lesson.create(:name => "1", :content => "blah", :number => 5, :section_id => test_section.id)
    visit section_lesson_path(test_section, test_lesson)
    click_on 'Previous'
    expect(page).to have_content '4'
  end
end
