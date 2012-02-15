if defined? Rails
  
  require 'yaml'
  require 'digest/md5'
  require 'cgi'
  require 'net/http'
  require 'uri'
  require 'nokogiri'

  require File.dirname(__FILE__) + '/lib/tencentpay/config'
  require File.dirname(__FILE__) + '/lib/tencentpay/request'
  require File.dirname(__FILE__) + '/lib/tencentpay/response'
  require File.dirname(__FILE__) + '/lib/tencentpay/query'
  require File.dirname(__FILE__) + '/lib/tencentpay/query_response'

end
