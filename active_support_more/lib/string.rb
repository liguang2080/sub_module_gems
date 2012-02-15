class String
  include ActionView::Helpers::JavaScriptHelper
  
  def is_a_number?
    self.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
  end
  
  def compile(hash)
    outStr = self.clone()
    hash.keys.each { |key|
      outStr.gsub!( /:::#{key}:::/, hash[key] )
    }
    outStr
  end
  
  def human_truncate(length  = 30)
    if self.nil? then return end
    (self.length > length ? self.mb_chars[0...length] : self).to_s
  end
  
  def strip_xml
    self.gsub(/<(.*?)>/, '')
  end
  
  def strip_tag_and_contents tag
    self.gsub(/<style.*>.*?<\/style>/mi, '')
  end

  def to_safe_uri
    self.strip.downcase.gsub('&', 'and').gsub(' ', '-').gsub(/[^\w-]/,'')
  end
  
  def from_safe_uri
    self.gsub('-', ' ')
  end

  def add_param args = {}
    self.strip + (self.include?('?') ? '&' : '?') + args.map { |k,v| "#{k}=#{URI.escape(v.to_s)}" }.join('&')
  end

  def to_formatted_date(format=nil)
    begin
      converted_date_value = Date.strptime(self.gsub(/\D/, '-').gsub(/-\d\d(\d\d)$/,'-\1'), format.gsub(/[\.\/]/, '-'))
      
			if converted_date_value.year < 1000
				converted_date_value = Date.strptime(self.gsub(/\D/, '-'), format.gsub(/[\.\/]/, '-').gsub('%Y', '%y'))
      end      
    rescue
      converted_date_value = Chronic.parse(self)
      converted_date_value = converted_date_value.to_date unless converted_date_value.blank?
    end
    return converted_date_value
  end
  
  
  def valid_email?
    !(self =~ /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i).nil?
  end
  
  def wrap_by(tag, options = {})
    attrs = options.inject("") do |sum, p| sum << p[0].to_s + "=" + "'#{p[1]}'"; sum end
    "<#{tag} #{attrs}>" + self + "</#{tag}>"
  end
  
  def wrap_by_exp(tag = "div")
    wrap_by(tag, :class => "error")
  end
  
  def to_formatted_post_body
    self.split("\n").map {|p| p.wrap_by("p")}.join("")
  end
  
  def to_escape_javascript
    escape_javascript(self)
  end
  
  def strip_tags
    ActionController::Base.helpers.strip_tags(self)
  end
end
