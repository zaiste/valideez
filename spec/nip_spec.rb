require 'spec_helper'

describe Valideez::Nip do
  it "should be valid" do
    %w[123-456-32-18].each do |n|
      Valideez::Nip.new(n).should be_valid
    end
  end
end
