require 'spec_helper'

describe Valideez::Nrb do
  it "should be valid" do
    %w[14194010765217890820000001 82124062471111000049791237].each do |n|
      Valideez::Nrb.new(n).should be_valid
    end
  end
  
    it "should be invalid" do
    %w[13194010765217890820000005 12334453546575473267345545 asdf4010765217890820000005].each do |n|
      Valideez::Nrb.new(n).should_not be_valid
    end
  end
end
