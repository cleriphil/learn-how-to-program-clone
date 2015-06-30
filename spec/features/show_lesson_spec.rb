require 'rails_helper'

describe "the consecutive lesson links" do
  it "goes to the next lesson" do
    Lesson.create(:name => "2", :content => "blah", :number => 2)
    Lesson.create(:name => "3", :content => "blah", :number => 3)
    Lesson.create(:name => "4", :content => "blah", :number => 4)
    test_lesson = Lesson.create(:name => "1", :content => "blah", :number => 1)
    visit lesson_path(test_lesson)
    click_on 'Next'
    expect(page).to have_content '2'
  end
  it "goes to the previous lesson" do

    Lesson.create(:name => "2", :content => "blah", :number => 2)
    Lesson.create(:name => "3", :content => "blah", :number => 3)
    Lesson.create(:name => "4", :content => "blah", :number => 4)

    test_lesson = Lesson.create(:name => "2", :content => "blah", :number => 5)
    visit lesson_path(test_lesson)
    click_on 'Previous'
    expect(page).to have_content '4'
  end
end
