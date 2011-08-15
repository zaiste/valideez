module Valideez
  module Common
    def validate_format
      not (format =~ val).nil?
    end

    def validate_length
      length == val.size
    end

  end
end
