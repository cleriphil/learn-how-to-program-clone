require 'rails_helper'

describe "the add a lesson process" do
  it "adds a new lesson" do
    visit lessons_path
    click_on 'Add a New Lesson'
    fill_in 'Name', :with => 'Ruby'
    fill_in 'Content', :with => 'Blah Blah'
    fill_in 'Number', :with => 1
    click_on 'Create Lesson'
    expect(page).to have_content 'Lessons'
  end
end

describe "the edit lesson process" do
  it "shows a lesson" do
    visit lessons_path
    click_on 'Add a New Lesson'
    fill_in 'Name', :with => 'Ruby'
    fill_in 'Content', :with => 'Blah Blah'
    fill_in 'Number', :with => 1
    click_on 'Create Lesson'
    click_on 'Ruby'
    expect(page).to have_content 'Blah Blah'
  end

  it "updates a lesson" do
    visit lessons_path
    click_on 'Add a New Lesson'
    fill_in 'Name', :with => 'Ruby'
    fill_in 'Content', :with => 'Blah Blah'
    fill_in 'Number', :with => 1
    click_on 'Create Lesson'
    click_on 'Ruby'
    click_on 'Edit'
    fill_in 'Name', :with => 'Rat'
    fill_in 'Content', :with => 'Ratty'
    fill_in 'Number', :with => 2
    click_on 'Update Lesson'
    expect(page).to have_content 'Rat'
  end
end
