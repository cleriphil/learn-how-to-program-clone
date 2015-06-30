require 'rails_helper'

describe "the delete section process" do
  it "deletes a section" do
    test_section = Section.create(:title => "Dumb Stuff")
    visit section_path(test_section)
    click_on 'Delete'
    expect(page).to have_no_content 'Dumb Stuff'
  end
end
