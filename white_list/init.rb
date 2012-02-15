require File.dirname(__FILE__) + '/lib/white_list_helper'

if defined? Rails
  ActionView::Base.send :include, WhiteListHelper
end
