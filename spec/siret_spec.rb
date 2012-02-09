require 'spec_helper'

describe Valideez::Siret do
  it "should be valid" do
    %w[73282932000074].each do |n|
      Valideez::Siret.new(n).should be_valid
    end
  end
end
