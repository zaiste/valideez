require 'spec_helper'
require 'rspec'
require 'active_model'

class RegonBastard
  include ActiveModel::Validations

  attr_accessor :regon
  validates :regon, :presence => true, :regon => true
end

describe RegonValidator do
  before :each  do
    @model = RegonBastard.new
  end

  it "should be valid" do
    @model.should_not be_valid 
    @model.regon = '590096454'
    @model.should be_valid
  end

  it "should be invalid" do
    @model.should_not be_valid 
    @model.regon = '590096453'
    @model.should_not be_valid
  end
end
