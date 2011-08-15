require 'active_model'

class PeselValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    @message = options[:message] || "invalid format"
    opts = options.reject{ |k| k == :message }

    record.errors.add(attribute,  @message) unless Valideez::Pesel.new(value, opts).valid?
  end
end

module ActiveModel
  module Validations
    module HelperMethods
      def validates_pesel_of(*attr_names)
        validates_with PeselValidator, _merge_attributes(attr_names)
      end
    end
  end
end
