# -*- encoding : utf-8 -*-
module Tencentpay
  module Config
    class << self
      attr_reader :bargainor_id, :key

      def load_config
        filename = "#{Rails.root}/config/tencentpay.yml"
        config = YAML.load(File.open(filename))
        @bargainor_id, @key = config['bargainor_id'], config['key']
        raise "Please configure your Tencentpay settings in #{filename}." unless @bargainor_id && @key
      end
    end
  end
end

Tencentpay::Config.load_config
