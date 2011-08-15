require 'spec_helper'
require 'rspec'
require 'active_model'

class Bastard
  include ActiveModel::Validations

  attr_accessor :pesel
  validates :pesel, :presence => true, :pesel => true
end

describe PeselValidator do
  before :each  do
    @model = Bastard.new
  end

  it "should be valid" do
    @model.should_not be_valid 
    @model.pesel = '68041979693' 
    @model.should be_valid
  end
end
