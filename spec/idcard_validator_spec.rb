require 'spec_helper'
require 'rspec'
require 'active_model'

class IdcardBastard
  include ActiveModel::Validations

  attr_accessor :idcard
  validates :idcard, :presence => true, :idcard => true
end

describe IdcardValidator do
  before :each  do
    @model = IdcardBastard.new
  end

  it "should be valid" do
    @model.should_not be_valid 
    @model.idcard = 'ATG910678' 
    @model.should be_valid
  end

  it "should be invalid" do
    @model.should_not be_valid 
    @model.idcard = 'AGS134759' 
    @model.should_not be_valid
  end
end
