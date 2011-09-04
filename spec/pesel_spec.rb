require 'spec_helper'

describe Valideez::Pesel  do
  it "should be valid"do
    %w[49040501580 93031908746].each do |n|
      Valideez::Pesel.new(n).should be_valid
    end
  end

  it "should be invalid" do
    %w[59040501580 870132114508 AABB].each do |n|
      Valideez::Pesel.new(n).should_not be_valid
    end
  end

  it "should be valid with minimum age defined" do
    %w[49040501580 10101341234].each do |n|
      Valideez::Pesel.new(n, :age => 18).should be_valid
    end

  end

  it "should be invalid when pesel is valid but the person is too young" do
    %w[05220471553].each do |n|
      Valideez::Pesel.new(n).should be_valid
      Valideez::Pesel.new(n, :age => 18).should_not be_valid
    end
  end
end