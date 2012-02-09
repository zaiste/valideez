module Valideez
  class Iban < Valideez::Base
    include Valideez::Common

    def initialize(val, options = {})
      super val

      assign({ 
        format: /\A[A-Z][A-Z]\d{26}\Z/, 
        length: 28,
        modulo: 97,
        sum_control: true,
      }.merge(options))

      @arr = []
    end

    def validate_sum_control
      mod = checksum % modulo
      mod === 1
    end

    private 

    def checksum
      @arr = val[4..28] + char_number(val[0..1]) + val[2..3]
      @arr.to_i
    end

    def char_number(chars)
      chars.split("").collect { |e| e.upcase.ord - 55 }.join
    end


  end
end
