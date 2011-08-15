module Valideez
  class Nip < Valideez::Base
    include Valideez::Common

    def initialize(val, options = {})
      super val

      assign({ 
        :format => /\A\d{10}\Z/, 
        :length => 10,
        :mask => [6, 5, 7, 2, 3, 4, 5, 6, 7],
        :modulo => 11,
        :sum_control => true,
      }.merge(options))

      @arr = []
    end

    def validate_sum_control
      mod = checksum % modulo
      mod === @arr.shift
    end

    private 

    def checksum
      @arr = val.split("").collect(&:to_i)
      mask.inject(0) {|sum, w| sum + w * @arr.shift}
    end

  end
end
