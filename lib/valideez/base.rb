module Valideez
  class Base
    attr_reader :val 
    attr_accessor :validable

    def initialize(val)
      @val = val.to_s.gsub(/-/, '').gsub(/\s+/, '')
      @validable = []
    end

    def valid?
      # p - Array of methods (Strings) which can be used for validation
      p = validable.select{ |var| respond_to?("validate_#{var.to_s}", true) }
      # execute validations, stop and return false if current validations return false
      p.take_while { |var| send("validate_#{var.to_s}") }.size == p.size
    end

    private

    # Dynamically assign instance variables using opts Hash
    def assign(opts)
      opts.each do |attr, val|
        # tricky: don't create an instance variable if 
        #   value is nil OR value is false
        if val
          instance_variable_set("@#{attr}", val) 
          # create read-only accessor
          self.class.send(:define_method, attr.to_s) do 
            instance_variable_get("@" + attr.to_s)
          end

          validable << attr.to_s
        end
      end 
    end
  end
end