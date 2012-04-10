# -*- encoding : utf-8 -*-
module Tencentpay
  class Request
    GATEWAY_URL = "https://www.tenpay.com/cgi-bin/v1.0/pay_gate.cgi"

    def initialize(sp_billno, total_fee, desc, return_url, spbill_create_ip = nil, attach = nil, bank_type = 0)
      @cmdno = 1
      @date  = Date.today.strftime("%Y%m%d")
      @bank_type = bank_type
      @desc = desc || "Description"

      @bargainor_id = Tencentpay::Config.bargainor_id
      @key = Tencentpay::Config.key

      @sp_billno = sp_billno.to_s
      @transaction_id = "%s%s%d" % [@bargainor_id, @date, @sp_billno]

      @total_fee = total_fee.to_i
      @fee_type = 1

      @return_url = return_url
      @attach = attach || 'nil'

      @spbill_create_ip = spbill_create_ip || '127.0.0.1'
      @cs = "utf-8"
    end

    def sign
      @sign ||= Digest::MD5.hexdigest(sign_params).downcase
    end

    def sign_params
      "cmdno=#{@cmdno}&date=#{@date}&bargainor_id=#{@bargainor_id}&transaction_id=#{@transaction_id}" +
      "&sp_billno=#{@sp_billno}&total_fee=#{@total_fee}&fee_type=#{@fee_type}" +
      "&return_url=#{@return_url}&attach=#{CGI.escape(@attach)}" +
      "&spbill_create_ip=#{@spbill_create_ip}&key=#{@key}"
    end

    def params
      "cmdno=#{@cmdno}&date=#{@date}&bank_type=#{@bank_type}&desc=#{CGI.escape(@desc)}" + 
      "&purchaser_id=&bargainor_id=#{@bargainor_id}&transaction_id=#{@transaction_id}" +
      "&sp_billno=#{@sp_billno}&total_fee=#{@total_fee}&fee_type=#{@fee_type}" +
      "&return_url=#{CGI.escape(@return_url)}&attach=#{CGI.escape(@attach)}" +
      "&spbill_create_ip=#{@spbill_create_ip}&cs=#{@cs}"
    end

    def url
      "#{GATEWAY_URL}?#{params}&sign=#{sign}"
    end
  end
end
