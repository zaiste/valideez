module Valideez
  class Siret < Valideez::Base
    include Valideez::Common

    def initialize(val, options = {})
      super val

      assign({ 
        :format => /\A\d{14}\Z/, 
        :length => 14,
        :mask => (1..14).to_a.map { |u| u % 2 + 1 },
        :modulo => 10,
        :sum_control => true,
      }.merge(options))

      @arr = []
    end

    def validate_sum_control
      mod = checksum % modulo
      mod === 0 
    end

    private 

    def checksum
      @arr = val.split("").collect(&:to_i)
      mask.inject(0) do |sum, w| 
        val =  w * @arr.shift
        val -= 9 if val >= 10
        sum + val
      end
    end

  end
end
