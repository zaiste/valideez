module Valideez
  class Nrb < Valideez::Base
    include Valideez::Common

    def initialize(val, options = {})
      super val

      assign({ 
        :format => /\A\d{26}\z/,
        :length => 26,
        :mask => [1, 10, 3, 30, 9, 90, 27, 76, 81, 34, 49, 5, 50, 15, 53, 45, 62, 38, 89, 17, 73, 51, 25, 56, 75, 71, 31, 19, 93, 57],
        :modulo => 97,
        :sum_control => true,
      }.merge(options))

      @arr = []
    end

    def validate_sum_control
      mod = checksum % modulo
      1 == mod
    end

    private 

    def checksum
			@arr = val.split("").collect(&:to_i).push(2, 5, 2, 1)
			@arr += @arr.shift(2)
			i = -1
			@arr.reverse.inject(0) {|sum, l| i += 1; sum + l * mask[i]}
		end
   

  end
end
