require 'spec_helper'
require 'rspec'
require 'active_model'

class NipBastard
  include ActiveModel::Validations

  attr_accessor :nip
  validates :nip, :presence => true, :nip => true
end

describe NipValidator do
  before :each  do
    @model = NipBastard.new
  end

  it "should be valid" do
    @model.should_not be_valid 
    @model.nip = '786-000-11-84'
    @model.should be_valid
  end

  it "should be invalid" do
    @model.should_not be_valid 
    @model.nip = '786-200-11-84'
    @model.should_not be_valid
  end
end
