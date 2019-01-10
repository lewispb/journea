require "simple_form_object"

module Journea
  class Step
    attr_accessor :journey

    include SimpleFormObject

    @custom_name = ""
    class << self
      attr_accessor :custom_name
    end

    def self.permitted_params
      attributes.map(&:name)
    end

    def self.step_name
      custom_name.presence || model_name.to_s.underscore
    end

    def step_name
      self.class.step_name
    end

    def pre_save(form_params) end

    def persisted?
      true
    end
  end
end
