require "spec_helper"

describe Valideez::Bastard do
  it "is valid" do
    Valideez::Bastard.new("1").should be_valid
  end
end