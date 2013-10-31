module StandaloneTypograf #:nodoc:
  module Dasherize
    extend ActiveSupport::Concern

    included do
      register_processor(Processor)
    end

    class Processor
    end
  end
end
