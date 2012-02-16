# -*- encoding : utf-8 -*-
module Tencentpay
  class Response
    attr_reader :sp_billno, :total_fee, :attach

    def initialize(params)
      @cmdno = params[:cmdno] || ''
      @pay_result = params[:pay_result] || ''
      @date = params[:date] || ''
      @transaction_id = params[:transaction_id] || ''
      @sp_billno = (params[:sp_billno] || '').to_i
      @total_fee = params[:total_fee] || ''
      @fee_type = params[:fee_type] || ''
      @attach = params[:attach] || ''

      @sign = params[:sign] || ''

      @bargainor_id = Tencentpay::Config.bargainor_id
      @key = Tencentpay::Config.key
    end

    def successful?
      @pay_result == '0' && valid_sign?
    end

    def valid_sign?
      @sign.downcase == Digest::MD5.hexdigest(sign_params).downcase
    end

    def sign_params
      "cmdno=#{@cmdno}&pay_result=#{@pay_result}&date=#{@date}&transaction_id=#{@transaction_id}" +
      "&sp_billno=#{@sp_billno}&total_fee=#{@total_fee}&fee_type=#{@fee_type}" +
      "&attach=#{CGI.escape(@attach)}&key=#{@key}"
    end

    def self.show_html(show_url)
      strHtml = <<-EOF
      <html>
      <head>
      <meta name="TENCENT_ONLINE_PAYMENT" content="China TENCENT">
      <script language="javascript">
      window.location.href='#{show_url}';
      </script>
      </head>
      <body></body>
      </html>
      EOF
    end
  end
end
