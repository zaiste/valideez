require 'spec_helper'

describe Valideez::Iban do
  it "should be valid" do
    %w[PL89114020040000330247593733].each do |n|
      Valideez::Iban.new(n).should be_valid
    end
  end

  it "should not be valid" do
    %w[PL89114020040000330247593734].each do |n|
      Valideez::Iban.new(n).should_not be_valid
    end
  end
end
