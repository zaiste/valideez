require 'spec_helper'
require 'rspec'
require 'active_model'

class SiretBastard
  include ActiveModel::Validations

  attr_accessor :siret
  validates :siret, :presence => true, :siret => true
end

describe SiretValidator do
  before :each  do
    @model = SiretBastard.new
  end

  it "should be valid" do
    @model.should_not be_valid 
    @model.siret = '73282932000074'
    @model.should be_valid
  end

  it "should be invalid" do
    @model.should_not be_valid 
    @model.siret = '7862001184'
    @model.should_not be_valid
  end
end
