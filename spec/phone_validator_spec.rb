require 'spec_helper'
require 'rspec'
require 'active_model'

class PhoneBastard
  include ActiveModel::Validations

  attr_accessor :phone
  validates :phone, :presence => true, :phone => true 
end

class MobilePhoneBastard
  include ActiveModel::Validations

  attr_accessor :phone
  validates :phone, :presence => true, :phone => { mobile: true }
end

describe PhoneValidator do
  before :each  do
    @phone= PhoneBastard.new
    @mobile_phone = MobilePhoneBastard.new
  end

  it "should be valid" do
    @phone.should_not be_valid 
    @phone.phone = '680419796' 
    @phone.should be_valid
  end

  it "should be invalid (too long)" do
    @phone.should_not be_valid 
    @phone.phone = '69041979693' 
    @phone.should_not be_valid
  end

  it "should be valid mobile" do
    @mobile_phone.should_not be_valid 
    @mobile_phone.phone = '503419796' 
    @mobile_phone.should be_valid
  end

  it "should be invalid with valid phone but not mobile " do
    @mobile_phone.should_not be_valid 
    @mobile_phone.phone = '990302513' 
    @mobile_phone.should_not be_valid
  end
end
