require 'spec_helper'

describe "dummy_records/new" do
  before(:each) do
    assign(:dummy_record, stub_model(DummyRecord,
      :field1 => "MyString",
      :field2 => "MyString"
    ).as_new_record)
  end

  it "renders new dummy_record form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => dummy_records_path, :method => "post" do
      assert_select "input#dummy_record_field1", :name => "dummy_record[field1]"
      assert_select "input#dummy_record_field2", :name => "dummy_record[field2]"
    end
  end
end
