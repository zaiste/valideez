require 'spec_helper'

describe Valideez::Phone do
  it "should be valid"do
    %w[490405015 930319087].each do |n|
      Valideez::Phone.new(n).should be_valid
    end
  end

  it "should be invalid" do
    %w[59040501580 870132114508 AABB].each do |n|
      Valideez::Phone.new(n).should_not be_valid
    end
  end

  it "should be valid mobile" do
    %w[503161754].each do |n|
      Valideez::Phone.new(n, mobile: true).should be_valid
    end

  end

  it "should be valid phone but invalid mobile" do
    %w[922123445].each do |n|
      Valideez::Phone.new(n).should be_valid
      Valideez::Phone.new(n, mobile: true).should_not be_valid
    end
  end
end
