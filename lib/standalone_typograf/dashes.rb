# frozen_string_literal: true

module StandaloneTypograf #:nodoc:
  module Dashes
    extend ActiveSupport::Concern

    CHAR = {
      html: '&mdash;',
      utf: '—'
    }.freeze

    included do
      register_processor(Processor)
    end

    module Processor
      def self.compile(text, mode)
        text.gsub(/(-|–)(\s)/, CHAR[mode] + '\2')
      end
    end
  end
end
