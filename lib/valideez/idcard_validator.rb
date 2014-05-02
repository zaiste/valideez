require 'active_model'

class IdcardValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    @message = options[:message] || "invalid format"
    record.errors[attribute] << @message unless Valideez::Idcard.new(value).valid?
  end
end

module ActiveModel
  module Validations
    module HelperMethods
      def validates_idcard_of(*attr_names)
        validates_with IdcardValidator, _merge_attributes(attr_names)
      end
    end
  end
end
