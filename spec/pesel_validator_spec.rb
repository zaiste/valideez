require 'spec_helper'
require 'rspec'
require 'active_model'

class PeselBastard
  include ActiveModel::Validations

  attr_accessor :pesel
  validates :pesel, :presence => true, :pesel => { age: 18 }
end

describe PeselValidator do
  before :each  do
    @model = PeselBastard.new
  end

  it "should be valid" do
    @model.should_not be_valid 
    @model.pesel = '68041979693' 
    @model.should be_valid
  end

  it "should be invalid" do
    @model.should_not be_valid 
    @model.pesel = '69041979693' 
    @model.should_not be_valid
  end

  it "should be invalid with valid PESEL but too young" do
    @model.should_not be_valid 
    @model.pesel = '99030251335' 
    @model.should_not be_valid
  end
end
