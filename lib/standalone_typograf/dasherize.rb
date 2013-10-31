module StandaloneTypograf #:nodoc:
  module Dasherize
    extend ActiveSupport::Concern

    CHARS = {
      :html => '&mdash;',
      :utf  => '—',
    }.freeze

    included do
      register_processor(Processor)
    end

    module Processor
      def self.compile(text, options={})
      end
    end
  end
end
