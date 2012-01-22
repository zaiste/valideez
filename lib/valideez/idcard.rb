module Valideez
  class Idcard < Valideez::Base
    include Valideez::Common

 		def initialize(val, options = {})
      super val

      assign({ 
        :length => 9,
        :format => /\A[A-Z]{3}\d{6}\Z/, 
        :mask => [7, 3, 1, 9, 7, 3, 1, 7, 3],
        :lvalues => { "A"=>10,"B"=>11,"C"=>12,"D"=>13,"E"=>14,"F"=>15,"G"=>16,
	                 "H"=>17,"I"=>18,"J"=>19,"K"=>20,"L"=>21,"M"=>22,"N"=>23,
	                 "O"=>24,"P"=>25,"Q"=>26,"R"=>27,"S"=>28,"T"=>29,"U"=>30,
	                 "V"=>31,"W"=>32,"X"=>33,"Y"=>34,"Z"=>35 },
        :modulo => 10,
        :sum_control => true,
      }.merge(options))

      @arr = []
    end
    
    def validate_sum_control
    	mod = checksum % modulo
    	@arr[3].to_i === mod
    end
    
   private
    
		def checksum  
			@arr = val.split("")
			i = -1
			letters = @arr[0..2].collect {|x| lvalues[x] }.inject(0) {|sum, l| i += 1; sum + l * mask[i]}
			i2 = 3
			digits = @arr[4..9].collect(&:to_i).inject(0) {|sum, l| i2 += 1; sum + l * mask[i2]}
			letters + digits                 
 	  end
	end
end
