# -*- encoding : utf-8 -*-
module Tencentpay
  class Query
    # GATEWAY_URL = "http://mch.tenpay.com/cgi-bin/cfbi_query_order_v3.cgi"
    # 
    # def initialize(sp_billno, date, attach = nil, charset = 'UTF-8')
    #   @cmdno = 2
    #   @date  = date.strftime("%Y%m%d")
    #   
    #   @bargainor_id = Tenpay::Config.bargainor_id
    #   @key = Tenpay::Config.key
    #   
    #   @sp_billno = sp_billno.to_i
    #   @transaction_id = "%s%s%010d" % [@bargainor_id, @date, @sp_billno]
    #   
    #   @attach = attach || 'nil'
    #   @output_xml = '1'
    #   @charset = charset
    # end
    # 
    # def sign_params
    #   "attach=#{@attach}&bargainor_id=#{@bargainor_id}&charset=#{@charset}&cmdno=#{@cmdno}&date=#{@date}&" +
    #   "output_xml=#{@output_xml}&sp_billno=#{@sp_billno}&transaction_id=#{@transaction_id}&key=#{@key}"
    # end
    # 
    # def params
    #   "cmdno=#{@cmdno}&date=#{@date}&bargainor_id=#{@bargainor_id}&transaction_id=#{@transaction_id}&sp_billno=#{@sp_billno}&" +
    #   "attach=#{@attach}&output_xml=#{@output_xml}&charset=#{@charset}&sign=#{sign}"
    # end
    # 
    # def sign
    #   Digest::MD5.hexdigest(sign_params).upcase
    # end
    # 
    # def response
    #   @response ||= QueryResponse.new(Net::HTTP.get(URI.parse("#{GATEWAY_URL}?#{params}")))
    # end
  end
end
