# encoding: UTF-8

module StandaloneTypograf #:nodoc:
  module Nbspaces
    extend ActiveSupport::Concern

    CHAR = {
      :html => '&nbsp;',
      :utf  => ' ',
    }.freeze

    PARTICLES = %w(
      разве неужели едва вряд вроде якобы мол дескать даже ведь таки лишь
      почти только исключительно вон вот именно точь-в-точь приблизительно прямо
    )

    included do
      register_processor(Processor)
    end

    module Processor
      def self.compile(text, mode)
        # One or three letter word - nbspace to the right
        text.gsub!(/(\s|^)([[:alpha:]]{1,2})(\s)/i, '\1\2'+CHAR[mode])

        # nbspace to the right
        text.gsub!(/(#{PARTICLES.join('|')})(\s)/i, '\1'+CHAR[mode])

        # dash - nbspace to the left
        text.gsub!(/(\s)(-|#{Dashes::CHAR[:html]}|#{Dashes::CHAR[:utf]})/i, CHAR[mode]+'\2')

        return text
      end
    end
  end
end
