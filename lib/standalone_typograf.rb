# encoding: UTF-8

require 'active_support/all'

module StandaloneTypograf #:nodoc:
  extend ActiveSupport::Autoload

  TAGS = {

  }.freeze

  CHARS = {
    :nbsp => { html: '&nbsp;', utf: ' ' } # No breaking space
  }.freeze

  @@processors = []

  class << self
    def register_processor(klass)
      @@processors << klass
    end

    def processors
      @@processors
    end
  end

  autoload :Version

  eager_autoload do
    autoload :Dasherize
    autoload :Mnemonics
  end

  include Dasherize
  include Mnemonics

  ##
  # === Options
  # * mode [Symbol]
  #   typograf supports <b>html</b> and </b>utf</b> mods.
  #   The default one is UTF. It means all special symbols
  #   will be represents as UTF sequence.
  #
  class Typograf
    attr_accessor :text
    attr_reader   :mode

    def initialize(text, options={})
      options.assert_valid_keys(:mode)
      @text = text
      @mode = validate_option(options[:mode].try(:to_sym), in: [:html, :utf]) || :utf
    end

    def get_char(name)
      CHARS[CHARS][mode]
    end

    private

      # Validate initialization options that have been passed thought the params.
      # 
      # Available validations:
      #   * in [Array] 
      #     provided param should be in array, for example:
      #    `validate_option(:hello, in: [:hello, :world])`
      #
      def validate_option(param, options={})
        return unless param.present?
        if options[:in].present?
          raise ArgumentError.new("Wrong argument `#{param}`, should be in `#{options[:in].join(', ')}`") unless options[:in].include?(param)
        end
        return param
      end
  end
end
