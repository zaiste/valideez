require 'spec_helper'

describe Valideez::Regon do
  it "should be valid" do
    %w[590096454 123456785 732065814].each do |n|
      Valideez::Regon.new(n).should be_valid
    end
  end

  it "should be valid 14-digit regon" do
    %w[12345678512347 23511332857188].each do |n|
      Valideez::Regon.new(n).should be_valid
    end
  end

  it "should be invalid" do
    %w[590096453 59009645412 390096454 ag5435 00000000 732065813].each do |n|
      Valideez::Regon.new(n).should_not be_valid
    end
  end

  it "should be invalid 14-digit regon" do
    %w[12345678512348 12345678512346 1234567851237 23511332857181].each do |n|
      Valideez::Regon.new(n).should_not be_valid
    end
  end
end
