class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # def self.validates_presence_of?(attribute)
  #   validators_on(attribute).
  #     map(&:class).
  #     include?(ActiveRecord::Validations::PresenceValidator)
  # end

  def self.presence_validator
    validators.detect { |validator| validator.is_a? ActiveRecord::Validations::PresenceValidator }
  end
end
