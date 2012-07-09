require 'spec_helper'

describe DummyRecord do

  before { @dr = DummyRecord.new(field1: "field1", field2: "field2") }

  it { @dr.should respond_to(:field1) }
  it { @dr.should respond_to(:field2) }

end
