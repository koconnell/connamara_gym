require 'spec_helper'

describe "dummy_records/index" do
  before(:each) do
    assign(:dummy_records, [
      stub_model(DummyRecord,
        :field1 => "Field1",
        :field2 => "Field2"
      ),
      stub_model(DummyRecord,
        :field1 => "Field1",
        :field2 => "Field2"
      )
    ])
  end

  it "renders a list of dummy_records" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field1".to_s, :count => 2
    assert_select "tr>td", :text => "Field2".to_s, :count => 2
  end
end
