require 'spec_helper'
require 'rspec'
require 'active_model'

class NrbBastard
  include ActiveModel::Validations

  attr_accessor :nrb
  validates :nrb, :presence => true, :nrb => true
end

describe NrbValidator do
  before :each  do
    @model = NrbBastard.new
  end

  it "should be valid" do
    @model.should_not be_valid 
    @model.nrb = '67160000030002000111111001'
    @model.should be_valid
  end

  it "should be invalid" do
    @model.should_not be_valid 
    @model.nrb = '14194010765217890820000005'
    @model.should_not be_valid
  end
end
