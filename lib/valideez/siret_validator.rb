require 'active_model'

class SiretValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    @message = options[:message] || "invalid format"
    record.errors[attribute] << @message unless Valideez::Siret.new(value).valid?
  end
end

module ActiveModel
  module Validations
    module HelperMethods
      def validates_siret_of(*attr_names)
        validates_with SiretValidator, _merge_attributes(attr_names)
      end
    end
  end
end
