require 'messages/list_message'

module VCAP::CloudController
  class ServiceBindingsListMessage < ListMessage
    ALLOWED_KEYS = [:page, :per_page, :order_by].freeze

    attr_accessor(*ALLOWED_KEYS)

    validates_with NoAdditionalParamsValidator

    def self.from_params(params)
      opts = params.dup

      new(opts.symbolize_keys)
    end

    def initialize(params={})
      super(params.symbolize_keys)
    end

    private

    def allowed_keys
      ALLOWED_KEYS
    end
  end
end