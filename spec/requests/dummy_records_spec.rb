require 'spec_helper'

describe "DummyRecords" do

  describe "index page" do
    it "should say 'Listing dummy_records'" do
      visit '/dummy_records'
      page.should have_content('Listing dummy_records')
    end
  end

end
