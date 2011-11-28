require 'active_model'

class RegonValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    @message = options[:message] || "invalid format"
    record.errors[attribute] << @message unless Valideez::Regon.new(value).valid?
  end
end

module ActiveModel
  module Validations
    module HelperMethods
      def validates_regon_of(*attr_names)
        validates_with RegonValidator, _merge_attributes(attr_names)
      end
    end
  end
end
