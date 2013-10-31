# encoding: UTF-8

module StandaloneTypograf #:nodoc:
  module Fractions
    extend ActiveSupport::Concern

    included do
      register_processor(Processor)
    end

    module Processor
      def self.compile(text, mode)
        return text unless mode == :html
        text.gsub!(/(?:\s|^)(\d+)(\/)(\d+)(?:\s|$)/, '<sup>\1</sup>&frasl;<sub>\3</sub>')
        return text
      end
    end
  end
end