require 'rails_helper'

describe "the delete lesson process" do
  it "deletes a lesson" do
    test_lesson = Lesson.create(:name => "1", :content => "blah", :number => 1)
    visit lesson_path(test_lesson)
    click_on 'Delete'
    expect(page).to have_no_content 'Rat'
  end
end
