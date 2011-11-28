module Valideez
  class Regon < Valideez::Base
    include Valideez::Common

    def initialize(val, options = {})
      super val

      assign({ 
        :format => /\A(\d{9}|\d{14})\Z/,
        :length => [9, 14],
        :mask => [8, 9, 2, 3, 4, 5, 6, 7],
        :mask_long => [2, 4, 8, 5, 0, 9, 7, 3, 6, 1, 2, 4, 8],
        :modulo => 11,
        :sum_control => true,
      }.merge(options))

      @arr = []
    end

    def is_long?
      val.size === 14
    end

    def validate_sum_control
      mod = checksum % modulo
      mod === @arr.shift
    end

    private 

    def checksum
      @arr = val.split("").collect(&:to_i)
      # there is the other mask for 14 digit regon
      m = is_long? ? mask_long : mask
      m.inject(0) {|sum, w| sum + w * @arr.shift}
    end

  end
end
