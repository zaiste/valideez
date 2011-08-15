require 'date'

module Valideez
  class Pesel < Valideez::Base
    include Valideez::Common

    def initialize(val, options = {})
      super val

      assign({ 
        :sum_control => true,
        :format => /\A\d{11}\Z/, 
        :length => 11,
        :mask => [1, 3, 7, 9, 1, 3, 7, 9, 1, 3],
        :modulo => 10,
        :age => 0,
      }.merge(options))

      @arr = []
    end

    def validate_sum_control
      mod = checksum % modulo
      mod = modulo - mod
      mod = 0 if mod == modulo 

      mod === @arr.shift
    end

    def validate_age
      now = Time.now
      y = (now.strftime("%Y").to_i - age).to_s
      m = now.strftime("%m")
      d = now.strftime("%d")

      age == 0 || convert_to_date(val[0..5]) <= Date.parse([y, m, d].join("-"))
    end

    private

    def checksum
      @arr = val.split("").collect(&:to_i)
      mask.inject(0) {|sum, w| sum + w * @arr.shift}
    end

    def convert_to_date(sample)
      y, m, d = sample.scan(/../)

      year = %w(19 20 21 22)[m[0].to_i / 2].to_s + y
      month = (m.to_i - m[0].to_i * 10).to_s

      Date.parse [year, month, d].join("-")
    end

  end

end
