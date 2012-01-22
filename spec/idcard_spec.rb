require 'spec_helper'

describe Valideez::Idcard do
  it "should be valid" do
    %w[ANM397327 ADM114580].each do |n|
      Valideez::Idcard.new(n).should be_valid
    end
  end
  
   it "should be invalid" do
    %w[APR985104 dadffs].each do |n|
      Valideez::Idcard.new(n).should_not be_valid
    end
  end
end
