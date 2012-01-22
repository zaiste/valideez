require 'active_model'

class NrbValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    @message = options[:message] || "invalid format"
    opts = options.reject{ |k| k == :message }

    record.errors.add(attribute,  @message) unless Valideez::Nrb.new(value, opts).valid?
  end
end

module ActiveModel
  module Validations
    module HelperMethods
      def validates_nrb_of(*attr_names)
        validates_with NrbValidator, _merge_attributes(attr_names)
      end
    end
  end
end
