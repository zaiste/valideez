module Valideez
  module Common
    def validate_format
      not (format =~ val).nil?
    end

    def validate_length
      # length can be a Fixnum or Array of Fixnums
      lengths = length.kind_of?(Array) ? length : [length]
      lengths.include? val.size
    end

  end
end
