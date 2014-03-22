require "spec_helper"

describe Valideez::LessInsulting do
  it "is valid" do
    Valideez::LessInsulting.new("1").should be_valid
  end
end
