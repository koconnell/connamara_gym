require 'spec_helper'

describe "dummy_records/show" do
  before(:each) do
    @dummy_record = assign(:dummy_record, stub_model(DummyRecord,
      :field1 => "Field1",
      :field2 => "Field2",
      :id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field1/)
    rendered.should match(/Field2/)
    rendered.should match(/1/)
  end
end
